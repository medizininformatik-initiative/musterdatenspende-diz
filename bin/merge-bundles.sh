#!/bin/bash 
#
#example: bash merge-bundles.sh *.json > transaction-bundle.json
jq -f <(cat << 'EOF'
# 1. Collect all entries from all input bundles ("slurp" all inputs)
reduce inputs as $bundle (
{
    "resourceType": "Bundle",
    "type": "transaction", # Set final bundle type to transaction
    "entry": []
};
    # Append entries only if the bundle has an 'entry' array
    if $bundle.entry then
        .entry += $bundle.entry
    else
        .
    end
)
# 2. Iterate over the accumulated entries and transform each one
| .entry |= map(
    # Get the resource type from the resource in the entry
    (.resource.resourceType) as $resourceType
    | .
    # Add the 'request' object for the transaction
    + {
        "request": {
            "method": "POST",
            # The URL is set to the resource type, e.g., "Patient"
            "url": $resourceType
        }
    }
    # Optional: Remove any existing fullUrl, as it may be confusing
    | del(.fullUrl)
    # Optional: Remove any existing search information from the searchset
    | del(.search)
)
# 3. Add the total element count (required for some systems)
| .total = (.entry | length)
EOF
) $*
