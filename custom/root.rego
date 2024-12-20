package permit.custom

import data.permit.utils.rebac
import future.keywords.in

default allow := false

# Helper to check if user has Report#editor role (direct or derived)
has_editor_role {
    print("Checking for editor role")
    user_key := sprintf("user:%s", [input.user.key])
    resource_id := sprintf("Report:%s", [input.resource.key])
    role := sprintf("%s#editor", [resource_id])
    
    # Check role assignments
    assignments := data.role_assignments[user_key]
    print(sprintf("User assignments: %v", [assignments]))
    role in assignments
}

# Allow editor write access only on draft reports
allow {
    print("Evaluating editor write permission on draft report")
    input.resource.type == "Report"
    input.resource.attributes.status == "draft"
    input.action == "write"
    has_editor_role
    print("Allowing editor write access on draft report")
}
