package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default EU_5f5fAdmin_5fon_5fReport_5fAllowWriteOnReport = false

EU_5f5fAdmin_5fon_5fReport_5fAllowWriteOnReport {
	conditionset.userset_EU_5fAdmin
	conditionset.resourceset_AllowWriteOnReport
	input.action in condition_set_permissions.EU_Admin.AllowWriteOnReport[input.resource.type]
}
