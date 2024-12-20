package permit.custom

import data.permit.utils.rebac
import data.permit.rebac
import future.keywords.in

default allow := false

# Allow editor write access only on draft reports
allow {
    print("Evaluating editor write permission on draft report")
    
    # Check if it's a Report in draft status
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    input.action == "write"
    
    # Check if editor role is in calculated rebac roles
    "editor" in data.permit.rebac.rebac_roles
    
    print("Allowing editor write access on draft report")
}
