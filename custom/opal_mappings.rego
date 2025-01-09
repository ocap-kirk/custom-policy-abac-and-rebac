package permit.custom
import future.keywords.in

region_by_common_name[name] := region {
 some _,country in data.countries
 name := country.name.common
 region := country.region
}

custom_user_attributes["region"] := region_by_common_name[data.users[input.user.key].attributes.country]
