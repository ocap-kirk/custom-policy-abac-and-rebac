package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default _5f5f_5f5fautogen_5f5fSSM_5f2dUsers_5fon_5fMovie_5fMinAge = false

_5f5f_5f5fautogen_5f5fSSM_5f2dUsers_5fon_5fMovie_5fMinAge {
	conditionset.userset__5f_5fautogen_5fSSM_2dUsers
	conditionset.resourceset_MinAge
	input.action in condition_set_permissions["__autogen_SSM-Users"].MinAge[input.resource.type]
}
