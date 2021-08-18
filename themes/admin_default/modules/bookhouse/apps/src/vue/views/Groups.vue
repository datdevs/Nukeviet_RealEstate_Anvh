<template>
  <div id="customer_group">
    <el-card style="margin-bottom: 20px">
      <div slot="header">
        <el-button type="primary" icon="el-icon-plus" @click="handleDrawer(true)">Thêm nhóm khách hàng</el-button>
        <el-button type="danger" icon="el-icon-delete" :disabled="btnDelState" @click="confirmDel(listDelete)"
          >Xóa</el-button
        >
      </div>
      <el-table :data="TableData" border @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="40" />
        <el-table-column label="Nhóm khách hàng" prop="title" />
        <el-table-column label="Trạng thái" prop="status">
          <template slot-scope="scope">
            {{ scope.row.status | statusFm }}
          </template>
        </el-table-column>
        <el-table-column width="90">
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
      @closed="resetForm('groupForm')"
    >
      <div v-loading="saveFormState" class="Drawer_Body_Inner">
        <el-form ref="groupForm" :model="formModel" :rules="rulesForm" label-position="top">
          <el-form-item label="Tên nhóm" prop="title">
            <el-input v-model="formModel.title"></el-input>
          </el-form-item>
          <el-form-item label="Trạng thái" prop="status">
            <el-select v-model="formModel.status">
              <el-option label="Đang hoạt động" :value="1"></el-option>
              <el-option label="Ngưng hoạt động" :value="0"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <div class="Drawer_Body_Inner_Footer">
        <el-button @click="handleDrawer(false)">Hủy bỏ</el-button>
        <el-button
          type="primary"
          icon="el-icon-check"
          :disabled="saveFormState"
          @click="FormState === 0 ? submitForm('groupForm') : submitFormEdit('groupForm')"
          >Lưu lại</el-button
        >
      </div>
    </el-drawer>
  </div>
</template>

<script>
import { group_get, group_add, group_del, group_update } from '@/api'
const { jQuery } = window

export default {
  filters: {
    statusFm(v) {
      return v ? 'Đang hoạt động' : 'Ngưng hoạt động'
    },
  },
  data() {
    return {
      TableData: null,
      page_size: null,
      page_total: null,
      current_page: 1,
      FormState: 0,
      DrawerTitle: 'Thêm Nhóm Khách Hàng',
      DrawerVisible: false,
      formModel: {
        title: '',
        status: 1,
      },
      rulesForm: {
        title: [{ required: true, message: 'Vui lòng nhập tên nhóm khách hàng', trigger: 'blur' }],
      },
      saveFormState: false,
      btnDelState: true,
      listDelete: [],
    }
  },
  mounted() {
    this.getGroupData(this.current_page)
  },
  methods: {
    getGroupData(page = 1) {
      const comp = this
      jQuery.get(group_get, { page: page }).done((resp) => {
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
      this.getGroupData(val)
    },
    submitForm(formName) {
      const comp = this
      comp.$refs[formName].validate((valid) => {
        if (valid) {
          comp.saveFormState = true
          const jsonData = JSON.stringify(this.formModel)
          jQuery
            .post(group_add, { data: jsonData })
            .done((resp) => {
              resp = JSON.parse(resp)
              if (resp.code !== 500) {
                comp.getGroupData(comp.current_page)
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
            .post(group_update, { data: jsonData })
            .done((resp) => {
              resp = JSON.parse(resp)
              if (resp.code !== 500) {
                comp.getGroupData(comp.current_page)
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
      this.$confirm('Nhóm khách hàng sẽ bị xóa vĩnh viễn?', 'Chú ý', {
        confirmButtonText: 'Chấp nhận',
        cancelButtonText: 'Hủy bỏ',
        type: 'warning',
      }).then(() => {
        jQuery
          .post(group_del, { data: jsonData })
          .done((resp) => {
            resp = JSON.parse(resp)
            if (resp.code !== 500) {
              comp.getGroupData(comp.current_page)
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
    resetForm(formName) {
      this.FormState = 0
      this.DrawerTitle = 'Thêm Nhóm Khách Hàng'
      this.$refs[formName].resetFields()
      this.resetCurrentForm()
    },
    resetCurrentForm() {
      this.formModel = {
        title: '',
        status: 1,
      }
    },
    editGroup(group) {
      this.FormState = 1
      this.DrawerTitle = 'Chỉnh sửa Nhóm Khách Hàng'
      this.formModel = { ...group }
      this.handleDrawer(true)
    },
  },
}
</script>
