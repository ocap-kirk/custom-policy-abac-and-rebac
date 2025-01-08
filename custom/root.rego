package permit.custom

import data.permit.utils.rebac
import data.permit.rebac
import future.keywords.in

default allow := false

# Allow editor write access only on draft reports
allow {    
    # Check if it's a Report in draft status and the action is "write"
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    input.action == "read"
    
    # Check if editor role is in calculated rebac roles
    "editor" in data.permit.rebac.rebac_roles
    # "viewer" in data.permit.rebac.rebac_roles
}
