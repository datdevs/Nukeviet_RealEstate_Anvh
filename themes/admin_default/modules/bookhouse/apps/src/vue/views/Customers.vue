<template>
  <div id="customer_list">
    <el-card style="margin-bottom: 20px">
      <div slot="header">
        <el-row>
          <el-form :inline="true" :model="searchData">
            <el-form-item>
              <el-input v-model="searchData.name" placeholder="Tên khách hàng"></el-input>
            </el-form-item>
            <el-form-item>
              <el-input v-model="searchData.phone" placeholder="Số điện thoại"></el-input>
            </el-form-item>
            <el-form-item>
              <el-select v-model="searchData.groupid" placeholder="Nhóm khách hàng">
                <el-option
                  v-for="group in listGroup"
                  :key="`group_option_${group.id}`"
                  :label="group.title"
                  :value="group.id"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" @click="handleSearching">Tìm kiếm</el-button>
            </el-form-item>
            <el-form-item>
              <el-button v-if="searchState" type="danger" icon="el-icon-close" @click="handleSearchClose"
                >Xóa tìm kiếm</el-button
              >
            </el-form-item>
          </el-form>
        </el-row>
        <el-row>
          <el-button type="primary" icon="el-icon-plus" @click="handleDrawer(true)">Thêm khách hàng</el-button>
          <el-button type="danger" icon="el-icon-delete" :disabled="btnDelState" @click="confirmDel(listDelete)"
            >Xóa</el-button
          >
          <el-button type="primary" icon="el-icon-download" @click="handleExcelImport"
            >Nhập danh sách khách hàng</el-button
          >
        </el-row>
      </div>
      <el-table :data="TableData" border @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="40" />
        <el-table-column label="Mã khách hàng" prop="customer_code" :width="128" />
        <el-table-column label="Khách hàng" prop="name" :min-width="200" />
        <el-table-column label="Nguồn khách hàng" prop="source" :min-width="200" />
        <el-table-column label="Nhóm khách hàng" prop="groupid" :min-width="200">
          <template slot-scope="scope">{{ formatGroupColumn(scope.row.groupid) }}</template>
        </el-table-column>
        <el-table-column label="Điện thoại" prop="phone" :min-width="150" />
        <el-table-column label="Email" prop="email" :min-width="150" />
        <el-table-column label="Địa chỉ" prop="address" :min-width="150" />
        <el-table-column label="Nhu cầu" prop="desire" :min-width="150" />
        <el-table-column label="Ghi chú" prop="note" :min-width="150" />
        <el-table-column width="90" fixed="right">
          <template slot-scope="scope">
            <el-row type="flex" justify="center">
              <el-button
                class="is-square"
                type="primary"
                size="mini"
                icon="el-icon-edit"
                @click.native.prevent="editGroup(scope.row)"
              />
              <el-button
                class="is-square"
                type="danger"
                size="mini"
                icon="el-icon-delete"
                @click.native.prevent="confirmDel(scope.row)"
              />
            </el-row>
          </template>
        </el-table-column>
      </el-table>
      <el-row type="flex" justify="end">
        <el-pagination
          background
          layout="prev, pager, next"
          :current-page="current_page"
          :total="page_total"
          :page-size="page_size"
          style="margin-top: 20px"
          @current-change="handleCurrentPageChange"
        ></el-pagination>
      </el-row>
    </el-card>
    <el-drawer
      :title="DrawerTitle"
      :visible.sync="DrawerVisible"
      size="35%"
      append-to-body
      @closed="resetForm('customerForm')"
    >
      <div class="Drawer_Body_Inner">
        <el-form ref="customerForm" :model="formModel" :rules="rulesForm" label-position="top">
          <el-form-item label="Mã khách hàng" prop="customer_code">
            <el-input v-model="formModel.customer_code"></el-input>
          </el-form-item>
          <el-form-item label="Tên khách hàng" prop="name">
            <el-input v-model="formModel.name"></el-input>
          </el-form-item>
          <el-form-item label="Nhóm khách hàng" prop="groupid">
            <el-select v-model="formModel.groupid" style="width: 100%">
              <el-option
                v-for="group in listGroup"
                :key="`group_option_${group.id}`"
                :label="group.title"
                :value="group.id"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Số điện thoại" prop="phone">
            <el-input v-model="formModel.phone"></el-input>
          </el-form-item>
          <el-form-item label="Email" prop="email">
            <el-input v-model="formModel.email"></el-input>
          </el-form-item>
          <el-form-item label="Tỉnh/Thành phố" prop="provinceid">
            <el-select v-model="formModel.provinceid" filterable style="width: 100%" @change="handlerProvince">
              <el-option
                v-for="province in array_province"
                :key="province.alias"
                :label="province.name"
                :value="province.provinceid"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Quận/Huyện" prop="districtid">
            <el-select
              v-model="formModel.districtid"
              filterable
              no-data-text="Chọn Tỉnh/Thành phố"
              style="width: 100%"
              @change="handlerDistrict"
            >
              <el-option
                v-for="district in array_district"
                :key="district.alias"
                :label="district.name"
                :value="district.districtid"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Phường/Xã" prop="wardid">
            <el-select v-model="formModel.wardid" filterable no-data-text="Chọn Quận/Huyện" style="width: 100%">
              <el-option
                v-for="ward in array_ward"
                :key="ward.alias"
                :label="ward.name"
                :value="ward.wardid"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Địa chỉ" prop="address">
            <el-input v-model="formModel.address"></el-input>
          </el-form-item>
          <el-form-item label="Nguồn khách hàng" prop="source">
            <el-input v-model="formModel.source"></el-input>
          </el-form-item>
          <el-form-item label="Nhu cầu" prop="desire">
            <el-input v-model="formModel.desire"></el-input>
          </el-form-item>
          <el-form-item label="Ghi chú" prop="note">
            <el-input v-model="formModel.note" type="textarea" :autosize="{ minRows: 3 }"> </el-input>
          </el-form-item>
        </el-form>
      </div>
      <div class="Drawer_Body_Inner_Footer">
        <el-button @click="handleDrawer(false)">Hủy bỏ</el-button>
        <el-button
          type="primary"
          icon="el-icon-check"
          :loading="saveFormState"
          @click="FormState === 0 ? submitForm('customerForm') : submitFormEdit('customerForm')"
          >Lưu lại</el-button
        >
      </div>
    </el-drawer>
    <el-dialog title="Nhập danh sách khách hàng" :visible.sync="DialogVisible" append-to-body fullscreen>
      <CustomersImport @update="getCustomerData(current_page)" />
    </el-dialog>
  </div>
</template>

<script>
import CustomersImport from './Customers-Import.vue'
import {
  customer_get,
  customer_add,
  customer_del,
  customer_update,
  customer_search,
  group_get,
  location_get,
} from '@/api'
const { jQuery } = window

export default {
  components: {
    CustomersImport,
  },
  data() {
    return {
      searchData: {
        name: '',
        phone: '',
        groupid: '',
      },
      TableData: null,
      page_size: null,
      page_total: null,
      current_page: 1,
      FormState: 0,
      DrawerTitle: 'Thêm Khách Hàng',
      DrawerVisible: false,
      DialogVisible: false,
      formModel: {
        groupid: null,
        customer_code: null,
        name: null,
        phone: null,
        email: null,
        provinceid: null,
        districtid: null,
        wardid: null,
        address: null,
        note: null,
        source: null,
        desire: null,
      },
      rulesForm: {
        customer_code: [{ required: true, message: 'Vui lòng nhập mã khách hàng', trigger: 'blur' }],
        name: [{ required: true, message: 'Vui lòng nhập tên khách hàng', trigger: 'blur' }],
        phone: [{ required: true, message: 'Vui lòng nhập số điện thoại khách hàng', trigger: 'blur' }],
        email: [{ required: true, message: 'Vui lòng nhập email khách hàng', trigger: 'blur' }],
      },
      saveFormState: false,
      btnDelState: true,
      listGroup: [],
      listDelete: [],
      array_province: array_province,
      array_district: [],
      array_ward: [],
      searchState: false,
    }
  },
  computed: {
    expire_time_pickerOptions() {
      const comp = this
      return {
        disabledDate(time) {
          return comp.formModel.start_date ? time.getTime() < comp.formModel.start_date : time.getTime() < Date.now()
        },
      }
    },
  },
  mounted() {
    this.getGroupData()
    this.getCustomerData(this.current_page)
  },
  methods: {
    handleExcelImport() {
      this.DialogVisible = true
    },
    getGroupData() {
      const comp = this
      jQuery.get(group_get, { page: 0 }).done((resp) => {
        const newResp = JSON.parse(resp)
        comp.listGroup = newResp.result
      })
    },
    getCustomerData(page = 1) {
      const comp = this
      jQuery.get(customer_get, { page: page }).done((resp) => {
        const newResp = JSON.parse(resp)
        comp.TableData = newResp.result
        comp.page_size = newResp.page_size
        comp.page_total = newResp.page_total
        comp.current_page = newResp.current_page
      })
    },
    handleDrawer(val) {
      this.DrawerVisible = val
    },
    handleSelectionChange(val) {
      if (val.length > 0) {
        this.listDelete = val
        this.btnDelState = false
      } else {
        this.listDelete = []
        this.btnDelState = true
      }
    },
    handleCurrentPageChange(val) {
      this.getCustomerData(val)
    },
    handlerProvince(val) {
      const comp = this
      jQuery.get(location_get, { province: val }).done((resp) => {
        const newResp = JSON.parse(resp)
        comp.array_district = Object.values(newResp)
      })
    },
    handlerDistrict(val) {
      const comp = this
      jQuery.get(location_get, { district: val }).done((resp) => {
        const newResp = JSON.parse(resp)
        comp.array_ward = Object.values(newResp)
      })
    },
    resetForm(formName) {
      this.FormState = 0
      this.DrawerTitle = 'Thêm Khách Hàng'
      this.$refs[formName].resetFields()
      this.resetCurrentForm()
    },
    resetCurrentForm() {
      this.formModel = {
        groupid: null,
        customer_code: null,
        name: null,
        phone: null,
        email: null,
        provinceid: null,
        districtid: null,
        wardid: null,
        address: null,
        note: null,
        source: null,
        desire: null,
      }
    },
    editGroup(group) {
      this.FormState = 1
      this.DrawerTitle = 'Chỉnh sửa Khách Hàng'
      this.formModel = { ...group }
      this.handleDrawer(true)
    },
    submitForm(formName) {
      const comp = this
      comp.$refs[formName].validate((valid) => {
        if (valid) {
          comp.saveFormState = true
          const jsonData = JSON.stringify(this.formModel)
          jQuery
            .post(customer_add, { data: jsonData })
            .done((resp) => {
              resp = JSON.parse(resp)
              if (resp.code !== 500) {
                comp.getCustomerData(comp.current_page)
                comp.resetForm(formName)
                comp.DrawerVisible = false
                comp.saveFormState = false
                comp.$message({
                  message: resp.mess,
                  duration: 6000,
                  type: 'success',
                })
              } else {
                comp.saveFormState = false
                comp.$message({
                  message: resp.mess,
                  duration: 6000,
                  type: 'error',
                })
              }
            })
            .fail(() => {
              comp.saveFormState = false
              comp.$message({
                message: 'Có lỗi xảy ra ở server.',
                duration: 6000,
                type: 'error',
              })
            })
        }
      })
    },
    submitFormEdit(formName) {
      const comp = this
      comp.$refs[formName].validate((valid) => {
        if (valid) {
          comp.saveFormState = true
          const jsonData = JSON.stringify(this.formModel)
          jQuery
            .post(customer_update, { data: jsonData })
            .done((resp) => {
              resp = JSON.parse(resp)
              if (resp.code !== 500) {
                comp.getCustomerData(comp.current_page)
                comp.resetForm(formName)
                comp.DrawerVisible = false
                comp.saveFormState = false
                comp.$message({
                  message: resp.mess,
                  duration: 6000,
                  type: 'success',
                })
              } else {
                comp.saveFormState = false
                comp.$message({
                  message: resp.mess,
                  duration: 6000,
                  type: 'error',
                })
              }
            })
            .fail(() => {
              comp.saveFormState = false
              comp.$message({
                message: 'Có lỗi xảy ra ở server.',
                duration: 6000,
                type: 'error',
              })
            })
        }
      })
    },
    confirmDel(group) {
      const comp = this
      const jsonData = JSON.stringify(group)
      this.$confirm('Thông tin khách hàng sẽ bị xóa vĩnh viễn?', 'Chú ý', {
        confirmButtonText: 'Chấp nhận',
        cancelButtonText: 'Hủy bỏ',
        type: 'warning',
      }).then(() => {
        jQuery
          .post(customer_del, { data: jsonData })
          .done((resp) => {
            resp = JSON.parse(resp)
            if (resp.code !== 500) {
              comp.getCustomerData(comp.current_page)
              comp.$message({
                message: resp.mess,
                duration: 6000,
                type: 'success',
              })
            } else {
              comp.$message({
                message: resp.mess,
                duration: 6000,
                type: 'error',
              })
            }
          })
          .fail(() => {
            comp.$message({
              message: 'Có lỗi xảy ra ở server.',
              duration: 6000,
              type: 'error',
            })
          })
      })
    },
    formatGroupColumn(id) {
      const res = this.listGroup.find((e) => e.id === id)
      return res ? res.title : ''
    },
    handleSearching() {
      const comp = this,
        jsonData = JSON.stringify(comp.searchData)

      if (this.searchData.name !== '' || this.searchData.phone !== '' || this.searchData.groupid !== '') {
        this.searchState = true
        jQuery.get(customer_search, { data: jsonData }).done((resp) => {
          const newResp = JSON.parse(resp)
          comp.TableData = newResp
        })
      }
    },
    handleSearchClose() {
      this.getCustomerData(1)
      this.searchState = false
      this.searchData = {
        name: '',
        phone: '',
        groupid: '',
      }
    },
  },
}
</script>
