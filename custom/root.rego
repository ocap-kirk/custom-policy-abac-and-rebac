package permit.custom

import data.permit.utils.rebac
import future.keywords.in

default allow := false

# Allow editor write access only on draft reports
allow {
    print("Evaluating editor write permission on draft report")
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    input.action == "write"
    
    # Use rebac utility to check role
    rebac.has_role("editor")
    
    print("Allowing editor write access on draft report")
}
