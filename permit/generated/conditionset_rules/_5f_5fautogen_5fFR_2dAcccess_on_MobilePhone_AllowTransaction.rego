package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default _5f5f_5f5fautogen_5f5fFR_5f2dAcccess_5fon_5fMobilePhone_5fAllowTransaction = false

_5f5f_5f5fautogen_5f5fFR_5f2dAcccess_5fon_5fMobilePhone_5fAllowTransaction {
	conditionset.userset__5f_5fautogen_5fFR_2dAcccess
	conditionset.resourceset_AllowTransaction
	input.action in condition_set_permissions["__autogen_FR-Acccess"].AllowTransaction[input.resource.type]
}
