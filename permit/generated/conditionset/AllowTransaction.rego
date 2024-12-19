package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_AllowTransaction = false

resourceset_AllowTransaction {
	attributes.resource.Amount < 100
	attributes.resource.type == "MobilePhone"
}
