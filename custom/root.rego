package permit.custom

import data.permit.utils.rebac
import future.keywords.in

# Resource set matching for draft reports
match_draft_report {
    print("Checking if resource is draft report")
    input.resource.type == "Report"
    print(sprintf("Resource type is Report, status is: %v", [input.resource.attributes.status]))
    input.resource.attributes.status == "draft"
}

# Resource set matching for approved reports
match_approved_report {
    print("Checking if resource is approved report")
    input.resource.type == "Report"
    print(sprintf("Resource type is Report, status is: %v", [input.resource.attributes.status]))
    input.resource.attributes.status == "approved"
}

# Get the user's Report roles
get_report_roles(resource_key) = roles {
    print(sprintf("Getting roles for resource key: %v", [resource_key]))
    user_key := sprintf("user:%s", [input.user.key])
    print(sprintf("User key: %v", [user_key]))
    role_assignments := data.role_assignments[user_key]
    print(sprintf("User role assignments: %v", [role_assignments]))
    resource_id := sprintf("Report:%s", [resource_key])
    
    roles := {role |
        assignment := role_assignments[_]
        [resource, role] := split(assignment, "#")
        resource == resource_id
    }
    print(sprintf("Extracted report roles: %v", [roles]))
}

# Additional permissions for draft reports
allow {
    print("Evaluating draft report editor permissions")
    match_draft_report
    roles := get_report_roles(input.resource.key)
    print(sprintf("Checking if user is editor. Roles: %v", [roles]))
    "editor" in roles
    print(sprintf("User is editor, checking action: %v", [input.action]))
    input.action in ["read", "write", "delete"]
}

allow {
    print("Evaluating draft report viewer permissions")
    match_draft_report
    roles := get_report_roles(input.resource.key)
    print(sprintf("Checking if user is viewer. Roles: %v", [roles]))
    "viewer" in roles
    print(sprintf("User is viewer, checking if action is read. Action: %v", [input.action]))
    input.action == "read"
}

# Additional permissions for approved reports
allow {
    print("Evaluating approved report viewer permissions")
    match_approved_report
    roles := get_report_roles(input.resource.key)
    print(sprintf("Checking if user is viewer. Roles: %v", [roles]))
    "viewer" in roles
    print(sprintf("User is viewer, checking if action is read. Action: %v", [input.action]))
    input.action == "read"
}

# If no status is provided, fall back to base ReBAC permissions
allow {
    print("No status provided, falling back to base ReBAC permissions")
    not input.resource.attributes.status
    print("Checking ReBAC allow")
    rebac.allow
}
