package permit.custom

import data.permit.utils.rebac
import data.permit.rebac
import future.keywords.in

default allow := false

# Allow editor twirl access only on draft reports
allow {    
    # Check if it's a Report in draft status and the action is "twirl"
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    input.action == "twirl"
    
    # Check if editor role is in calculated rebac roles
    "editor" in data.permit.rebac.rebac_roles
}

# Allow viewer read access on draft reports
allow {
    # Check if it's a Report in draft status and the action is "read"
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    input.action == "read"
    
    # Check if viewer role is in calculated rebac roles
    "viewer" in data.permit.rebac.rebac_roles
}
