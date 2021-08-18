const { script_name, nv_name_variable, nv_module_name, nv_fc_variable } = window

const location_get =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&location_get=1'

const group_get =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&group_get=1'

const group_add =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&group_add=1'

const group_del =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&group_del=1'

const group_update =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&group_update=1'

const customer_get =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&get=1'

const customer_add =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&add=1'

const customer_del =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&del=1'

const customer_update =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&update=1'

const customer_import =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&import=1'

const customer_search =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=customers&search=1'

const transaction_type_update =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=transactions&code_update=1'

const transaction_get =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=transactions&get=1'

const transaction_add =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=transactions&add=1'

const transaction_del =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=transactions&del=1'

const transaction_update =
  script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=transactions&update=1'

export {
  location_get,
  group_get,
  group_add,
  group_del,
  group_update,
  customer_get,
  customer_add,
  customer_del,
  customer_update,
  customer_import,
  customer_search,
  transaction_type_update,
  transaction_get,
  transaction_add,
  transaction_del,
  transaction_update,
}
