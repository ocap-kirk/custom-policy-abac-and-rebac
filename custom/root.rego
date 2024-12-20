package permit.custom

import data.permit.utils.rebac
import future.keywords.in

# Resource set matching for draft reports
match_draft_report {
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
}

# Resource set matching for approved reports
match_approved_report {
    input.resource.type == "Report"
    input.resource.attributes.status == "approved"
}

# Get the user's Report roles
get_report_roles(resource_key) = roles {
    user_key := sprintf("user:%s", [input.user.key])
    role_assignments := data.role_assignments[user_key]
    resource_id := sprintf("Report:%s", [resource_key])
    
    roles := {role |
        assignment := role_assignments[_]
        [resource, role] := split(assignment, "#")
        resource == resource_id
    }
}

# Additional permissions for draft reports
allow {
    match_draft_report
    roles := get_report_roles(input.resource.key)
    "editor" in roles
    input.action in ["read", "write", "delete"]
}

allow {
    match_draft_report
    roles := get_report_roles(input.resource.key)
    "viewer" in roles
    input.action == "read"
}

# Additional permissions for approved reports
allow {
    match_approved_report
    roles := get_report_roles(input.resource.key)
    "viewer" in roles
    input.action == "read"
}

# If no status is provided, fall back to base ReBAC permissions
allow {
    not input.resource.attributes.status
    rebac.allow
}
