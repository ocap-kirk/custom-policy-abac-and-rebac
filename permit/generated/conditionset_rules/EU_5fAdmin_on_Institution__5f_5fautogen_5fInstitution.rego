package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default EU_5f5fAdmin_5fon_5fInstitution_5f_5f5f_5f5fautogen_5f5fInstitution = false

EU_5f5fAdmin_5fon_5fInstitution_5f_5f5f_5f5fautogen_5f5fInstitution {
	conditionset.userset_EU_5fAdmin
	conditionset.resourceset__5f_5fautogen_5fInstitution
	input.action in condition_set_permissions.EU_Admin.__autogen_Institution[input.resource.type]
}
