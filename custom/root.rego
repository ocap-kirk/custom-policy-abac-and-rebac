package permit.custom

import data.permit.utils.rebac
import data.permit.rebac
import future.keywords.in

default allow := false

# Allow editor actions on draft reports
allow {    
    # Check if it's a Report in draft status
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    
    # Check if editor role is in calculated rebac roles
    "editor" in data.permit.rebac.rebac_roles

    # Check if the action is allowed for editors
    input.action in data.role_permissions.Report.editor.grants.Report
}

# Allow viewer actions on draft reports
allow {
    # Check if it's a Report in draft status
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    
    # Check if viewer role is in calculated rebac roles
    "viewer" in data.permit.rebac.rebac_roles

    # Check if the action is allowed for viewers
    input.action in data.role_permissions.Report.viewer.grants.Report
}
