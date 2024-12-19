package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_AllowWriteOnReport = false

resourceset_AllowWriteOnReport {
	attributes.resource.reportstatus == "Approved"
	attributes.resource.type == "Report"
}
