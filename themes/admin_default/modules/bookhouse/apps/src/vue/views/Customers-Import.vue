<template>
  <div v-loading="loading">
    <div>
      <el-alert :class="$style.Mb10" title="Mẫu file Excel import khách hàng:" type="info" show-icon :closable="false">
        <a :class="$style.FileLink" :href="excelFile"><excel-icon />Danh sách khách hàng.xlsx</a>
      </el-alert>
      <el-alert title="Hướng dẫn:" type="info" show-icon>
        <p><strong>Mã khách hàng, Tên khách hàng, Số điện thoại, Email:</strong> Bắt buộc nhập, không được để trống.</p>
        <p>
          <strong>Tỉnh/Thành phố/Quận/Huyện/Phường/Xã:</strong> Nhập chính xác tên riêng nếu sai dữ liệu sẽ không được
          nhập (ví dụ: Hà Nội, Hồ Chí Minh, Nha Trang).
        </p>
        <p><strong>Nhóm khách hàng:</strong> Nhập chính xác tên nhóm ở tab nhóm khách hàng.</p>
      </el-alert>
    </div>
    <div :class="$style.UploadWrap">
      <UploadExcelFile :on-success="handleSuccess" :before-upload="resetData" />
    </div>
    <div v-if="data.length > 0" :class="$style.TableWrap">
      <el-alert
        v-for="(e, i) in error"
        :key="`error_${i}`"
        :class="$style.Mb10"
        :title="e"
        type="error"
        show-icon
        :closable="false"
      ></el-alert>
      <div :class="$style.Mb30">
        <el-button
          type="primary"
          size="small"
          icon="el-icon-download"
          :disabled="error.length > 0"
          :loading="stateSave"
          @click="handleSaveData"
          >Nhập dữ liệu</el-button
        >
      </div>
      <el-table :data="data" border fit show-overflow-tooltip :max-height="528">
        <el-table-column
          v-for="field in fields"
          :key="`csi_${field.key}`"
          :label="field.label"
          :prop="field.prop"
          :min-width="field.mwidth"
        />
      </el-table>
    </div>
    <div v-if="data.length === 0 && success" :class="$style.SuccessNoti">
      <el-alert
        title="Danh sách đã được thêm vào thành công, bạn có thể click Quay lại để kiểm tra danh sách vừa thêm vào hoặc tiếp tục chọn file để thêm danh sách mới."
        type="success"
        show-icon
        :closable="false"
      ></el-alert>
    </div>
  </div>
</template>

<script>
import UploadExcelFile from '@/vue/components/UploadExcelFile'
import ExcelIcon from '@/vue/components/ExcelIcon'
import mapKeys from 'lodash.mapkeys'
import mapValues from 'lodash.mapvalues'
import { customer_import } from '@/api'

const { jQuery } = window

export default {
  name: 'CustomersImport',
  components: {
    UploadExcelFile,
    ExcelIcon,
  },
  data() {
    return {
      fields: [
        { key: 'customer_code', label: 'Mã khách hàng', prop: 'customer_code', mwidth: '200' },
        { key: 'source', label: 'Nguồn khách hàng', prop: 'source', mwidth: '200' },
        { key: 'groupid', label: 'Nhóm khách hàng', prop: 'groupid', mwidth: '200' },
        { key: 'name', label: 'Tên khách hàng', prop: 'name', mwidth: '200' },
        { key: 'phone', label: 'Số điện thoại', prop: 'phone', mwidth: '200' },
        { key: 'email', label: 'Email', prop: 'email', mwidth: '200' },
        { key: 'provinceid', label: 'Tỉnh/Thành phố', prop: 'provinceid', mwidth: '200' },
        { key: 'districtid', label: 'Quận/Huyện', prop: 'districtid', mwidth: '200' },
        { key: 'wardid', label: 'Phường/Xã', prop: 'wardid', mwidth: '200' },
        { key: 'address', label: 'Địa chỉ', prop: 'address', mwidth: '200' },
        { key: 'desire', label: 'Nhu cầu', prop: 'desire', mwidth: '200' },
        { key: 'note', label: 'Ghi chú', prop: 'note', mwidth: '200' },
      ],
      data: [],
      loading: false,
      success: false,
      stateSave: false,
      tableNewKey: {
        'Mã khách hàng': 'customer_code',
        'Nguồn khách hàng': 'source',
        'Nhóm khách hàng': 'groupid',
        'Khách hàng': 'name',
        'Số điện thoại': 'phone',
        Email: 'email',
        'Tỉnh/Thành phố': 'provinceid',
        'Quận/Huyện': 'districtid',
        'Phường/Xã': 'wardid',
        'Địa chỉ': 'address',
        'Nhu cầu': 'desire',
        'Ghi chú': 'note',
      },
      error: [],
      excelFile: '/themes/admin_default/images/excel-customers-import.xlsx',
    }
  },
  methods: {
    resetData() {
      this.loading = true
      this.data = []
      this.error = []
      this.success = false
      return true
    },
    handleSuccess({ header, results }) {
      const comp = this
      let newResult = results.map((r, i) => {
        let newR = mapKeys(r, (value, key) => {
          return comp.tableNewKey[key]
        })
        if (!newR.hasOwnProperty('customer_code') || newR.customer_code === '') {
          comp.error.push(
            `Lỗi: "Mã khách hàng" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`
          )
        }
        if (!newR.hasOwnProperty('name') || newR.name === '') {
          comp.error.push(
            `Lỗi: "Tên khách hàng" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`
          )
        }
        if (!newR.hasOwnProperty('phone') || newR.phone === '') {
          comp.error.push(
            `Lỗi: "Số điện thoại" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`
          )
        }
        if (!newR.hasOwnProperty('email') || newR.email === '') {
          comp.error.push(`Lỗi: "Email" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`)
        }
        newR = mapValues(newR, (value, key) => {
          let newValue = String(value)
          return newValue
        })
        return newR
      })

      this.data = newResult
      this.loading = false
    },
    handleSaveData() {
      const comp = this
      comp.stateSave = true
      const jsonData = JSON.stringify(this.data)
      jQuery
        .post(customer_import, { data: jsonData })
        .done((resp) => {
          resp = JSON.parse(resp)
          if (resp.code !== 500) {
            comp.stateSave = false
            comp.data = []
            comp.error = []
            comp.success = true
            comp.$message({
              message: resp.mess,
              duration: 6000,
              type: 'success',
            })
            comp.$emit('update')
          } else {
            comp.stateSave = false
            comp.$message({
              message: resp.mess,
              duration: 6000,
              type: 'error',
            })
            comp.$emit('update')
          }
        })
        .fail(() => {
          comp.stateSave = false
          comp.$message({
            message: 'Có lỗi xảy ra ở server, danh sách vẫn chưa được nhập.',
            duration: 6000,
            type: 'error',
          })
          comp.$emit('update')
        })
    },
  },
}
</script>

<style lang="scss" module>
.UploadWrap,
.TableWrap,
.SuccessNoti {
  margin-top: 30px;
}

.FlexCenter {
  align-items: center;
  display: flex;
}

.Mb10 {
  margin-bottom: 10px;
}

.Mb30 {
  margin-bottom: 30px;
}

.FileLink {
  color: #1d6f42;
  font-size: 18px;
  display: inline-flex;
  align-items: center;

  svg {
    width: 20px;
    margin-right: 5px;
    margin-top: -2px;
  }
}
</style>
