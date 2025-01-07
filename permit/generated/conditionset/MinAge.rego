package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_MinAge = false

resourceset_MinAge {
	attributes.resource.minimumage >= attributes.user.age
	attributes.resource.type == "Movie"
}
