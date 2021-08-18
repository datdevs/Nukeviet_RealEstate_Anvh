<template>
  <div id="customer_list">
    <el-card style="margin-bottom: 20px">
      <div slot="header">
        <TransactionType />
        <el-row>
          <el-button type="primary" icon="el-icon-plus" @click="handleDrawer(true)">Tạo giao dịch</el-button>
          <el-button type="danger" icon="el-icon-delete" :disabled="btnDelState" @click="confirmDel(listDelete)"
            >Xóa</el-button
          >
          <el-button type="success" icon="el-icon-upload2" @click="handleExcelExport">Xuất toàn bộ giao dịch</el-button>
        </el-row>
      </div>
      <el-table :data="TableData" border @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="40" />
        <el-table-column label="Mã giao dịch" prop="transaction_code" :width="150">
          <template slot-scope="scope"> {{ transaction_type + scope.row.transaction_code }} </template>
        </el-table-column>
        <el-table-column label="Mã khách hàng" prop="customer.customer_code" :width="128" />
        <el-table-column label="Khách hàng" prop="customer.name" :min-width="200" />
        <el-table-column label="Điện thoại" prop="customer.phone" :min-width="150" />
        <el-table-column label="Email" prop="customer.email" :min-width="150" />
        <el-table-column label="Mã bất động sản" prop="bds_id" :min-width="150" />
        <el-table-column label="Nhu cầu" prop="customer.desire" :min-width="150" />
        <el-table-column label="Ngày ký hợp đồng" prop="start_date" :min-width="150">
          <template slot-scope="scope">
            {{ scope.row.start_date | parseTime('{d}/{m}/{y}') }}
          </template>
        </el-table-column>
        <el-table-column label="Ngày kết thúc" prop="end_date" :min-width="150">
          <template slot-scope="scope">
            {{ scope.row.start_date | parseTime('{d}/{m}/{y}') }}
          </template>
        </el-table-column>
        <el-table-column label="Trạng thái giao dịch" prop="status" :min-width="180">
          <template slot-scope="scope">
            {{ scope.row.status | statusFm }}
          </template>
        </el-table-column>
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
      @closed="resetForm('transactionForm')"
    >
      <div class="Drawer_Body_Inner">
        <el-form ref="transactionForm" :model="formModel" :rules="rulesForm" label-position="top">
          <el-form-item label="Chọn khách hàng" prop="customer_id">
            <el-select v-model="formModel.customer_id" filterable style="width: 100%">
              <el-option
                v-for="customer in list_customers"
                :key="customer.alias"
                :label="customer.name"
                :value="customer.id"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Mã bất động sản" prop="bds_id">
            <el-input v-model="formModel.bds_id"></el-input>
          </el-form-item>
          <el-form-item label="Trạng thái giao dịch" prop="status">
            <el-select v-model="formModel.status" style="width: 100%">
              <el-option
                v-for="stt in customerStatus"
                :key="`customerStatus_${stt.id}`"
                :label="stt.label"
                :value="stt.id"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Link bất động sản" prop="bds_link">
            <el-input v-model="formModel.bds_link" type="textarea" :autosize="{ minRows: 3 }"> </el-input>
          </el-form-item>
          <el-form-item label="Ngày ký hợp đồng" prop="start_date">
            <el-date-picker v-model="formModel.start_date" type="date" format="dd/MM/yyyy" value-format="timestamp" />
          </el-form-item>
          <el-form-item label="Ngày kết thúc" prop="end_date">
            <el-date-picker
              v-model="formModel.end_date"
              type="date"
              format="dd/MM/yyyy"
              value-format="timestamp"
              :picker-options="expire_time_pickerOptions"
            />
          </el-form-item>
          <el-form-item label="Nội dung giao dịch" prop="note">
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
          @click="FormState === 0 ? submitForm('transactionForm') : submitFormEdit('transactionForm')"
          >Lưu lại</el-button
        >
      </div>
    </el-drawer>
  </div>
</template>

<script>
import TransactionType from '../components/TransactionType'
import { transaction_get, transaction_add, transaction_del, transaction_update } from '@/api'
import { parseTime } from '@/filters/index'
const { jQuery } = window

const customerStatus = [
  {
    id: 0,
    label: 'Đã hết hạn',
  },
  {
    id: 1,
    label: 'Chờ xử lý',
  },
  {
    id: 2,
    label: 'Đang thuê',
  },
  {
    id: 3,
    label: 'Đã mua',
  },
]

export default {
  filters: {
    parseTime,
    statusFm(v) {
      return customerStatus.find((e) => e.id === v).label
    },
  },
  components: {
    TransactionType,
  },
  data() {
    return {
      searchData: {
        name: '',
        phone: '',
        group: '',
      },
      TableData: null,
      page_size: null,
      page_total: null,
      current_page: 1,
      FormState: 0,
      DrawerTitle: 'Tạo Giao Dịch',
      DrawerVisible: false,
      formModel: {
        customer_id: null,
        bds_id: null,
        bds_link: null,
        note: null,
        start_date: Date.now(),
        end_date: Date.now(),
        status: 1,
      },
      rulesForm: {
        customer_id: [{ required: true, message: 'Vui lòng chọn khách hàng', trigger: 'blur' }],
        bds_id: [{ required: true, message: ' Vui lòng nhập mã bất động sản', trigger: 'blur' }],
      },
      saveFormState: false,
      btnDelState: true,
      listGroup: [],
      listDelete: [],
      customerStatus,
      list_customers: list_customers,
      transaction_type: transaction_type,
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
    this.getTransactionData(this.current_page)
  },
  methods: {
    handleExcelExport() {
      import('@/vendor/E2E').then((excel) => {
        const excelHeader = [
          'Mã giao dịch',
          'Mã khách hàng',
          'Tên khách hàng',
          'Điện thoại',
          'Email',
          'Mã bất động sản',
          'Link bất động sản',
          'Nhu cầu',
          'Ngày ký hợp đồng',
          'Ngày kết thúc',
          'Trạng thái giao dịch',
          'Nội dung giao dịch',
        ]
        const filterVal = [
          'transaction_code',
          'customer_code',
          'name',
          'phone',
          'email',
          'bds_id',
          'bds_link',
          'desire',
          'start_date',
          'end_date',
          'status',
          'note',
        ]
        const excelData = this.formatJson(filterVal, this.TableData)
        excel.export_json_to_excel({
          header: excelHeader,
          data: excelData,
          filename: 'Xuất danh sách giao dịch',
          autoWidth: true,
          bookType: 'xlsx',
        })
      })
    },
    formatJson(filterVal, jsonData) {
      const comp = this
      return jsonData.map((v) =>
        filterVal.map((j) => {
          if (j === 'transaction_code') {
            return comp.transaction_type + v[j]
          } else if (j === 'start_date' || j === 'end_date') {
            return parseTime(v[j], '{d}/{m}/{y}')
          } else if (j === 'status') {
            return comp.customerStatus.find((e) => e.id === v[j]).label
          } else if (j === 'customer_code') {
            return (v[j] = v['customer'][j])
          } else if (j === 'name') {
            return (v[j] = v['customer'][j])
          } else if (j === 'phone') {
            return (v[j] = v['customer'][j])
          } else if (j === 'email') {
            return (v[j] = v['customer'][j])
          } else if (j === 'desire') {
            return (v[j] = v['customer'][j])
          } else {
            return v[j]
          }
        })
      )
    },
    getTransactionData(page = 1) {
      const comp = this
      jQuery.get(transaction_get, { page: page }).done((resp) => {
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
      this.getTransactionData(val)
    },
    resetForm(formName) {
      this.FormState = 0
      this.DrawerTitle = 'Tạo Giao Dịch'
      this.$refs[formName].resetFields()
      this.resetCurrentForm()
    },
    resetCurrentForm() {
      this.formModel = {
        customer_id: null,
        bds_id: null,
        bds_link: null,
        note: null,
        start_date: Date.now(),
        end_date: Date.now(),
        status: 1,
      }
    },
    editGroup(group) {
      this.FormState = 1
      this.DrawerTitle = 'Chỉnh sửa Giao dịch'
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
            .post(transaction_add, { data: jsonData })
            .done((resp) => {
              resp = JSON.parse(resp)
              if (resp.code !== 500) {
                comp.getTransactionData(comp.current_page)
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
            .post(transaction_update, { data: jsonData })
            .done((resp) => {
              resp = JSON.parse(resp)
              if (resp.code !== 500) {
                comp.getTransactionData(comp.current_page)
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
      this.$confirm('Thông tin giao dịch sẽ bị xóa vĩnh viễn?', 'Chú ý', {
        confirmButtonText: 'Chấp nhận',
        cancelButtonText: 'Hủy bỏ',
        type: 'warning',
      }).then(() => {
        jQuery
          .post(transaction_del, { data: jsonData })
          .done((resp) => {
            resp = JSON.parse(resp)
            if (resp.code !== 500) {
              comp.getTransactionData(comp.current_page)
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
    handleSearching() {},
  },
}
</script>
