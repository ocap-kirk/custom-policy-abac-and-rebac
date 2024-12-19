package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_EU_5fAdmin = false

userset_EU_5fAdmin {
	attributes.user.location == "EU"
}
