<template>
  <div v-loading="loading" :class="$style.ImportPage">
    <el-page-header title="Quay lại" content="Import File Excel" @back="goBackConponPage"></el-page-header>
    <div :class="$style.InstructionWrap">
      <el-alert :class="$style.Mb10" title="Mẫu file Excel import dự án:" type="info" show-icon :closable="false">
        <a :class="$style.FileLink" :href="excelFile"><excel-icon />Danh sách dự án.xlsx</a>
      </el-alert>
      <el-alert title="Hướng dẫn:" type="info" show-icon>
        <p><strong>Tên dự án, Tỉnh/Thành phố/Quận/Huyện/Phường/Xã:</strong> Bắt buộc nhập, không được để trống.</p>
        <p>
          <strong>Tỉnh/Thành phố/Quận/Huyện/Phường/Xã:</strong> Nhập chính xác tên riêng nếu sai dữ liệu sẽ không được
          nhập (ví dụ: Hà Nội, Hồ Chí Minh, Nha Trang).
        </p>
        <p>
          <strong>Tiện ích và Nội thất:</strong> Chỉ cần thêm số thứ tự của tiện ích, nội thất trong Menu Tiện ích, Nội
          thất. Mỗi tiện ích hoặc nội thất cách nhau bằng dấu phẩy (ví dụ: 1,2,3,4,5).
        </p>
        <p><strong>Hình ảnh:</strong> Sử dụng URL hình ảnh, thêm nhiều hình cách nhau bằng dấu phẩy.</p>
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
          :key="`coupon_${field.key}`"
          :min-width="field.mwidth"
          :label="field.label"
          :fixed="field.key === 'title'"
          :prop="field.prop"
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

const { jQuery, script_name, nv_name_variable, nv_module_name, nv_fc_variable } = window

export default {
  name: 'ImportView',
  components: {
    UploadExcelFile,
    ExcelIcon,
  },
  data() {
    return {
      fields: [
        { key: 'project_type', label: 'Loại dự án', prop: 'project_type', required: true },
        { key: 'title', label: 'Tên dự án', prop: 'title', required: true, mwidth: '300' },
        { key: 'provinceid', label: 'Tỉnh/Thành phố', prop: 'provinceid', required: true, mwidth: '150' },
        { key: 'districtid', label: 'Quận/Huyện', prop: 'districtid', required: true, mwidth: '150' },
        { key: 'wardid', label: 'Phường/Xã', prop: 'wardid', required: true, mwidth: '150' },
        { key: 'chudautu', label: 'Chủ đầu tư', prop: 'chudautu', mwidth: '150' },
        { key: 'vondautu', label: 'Vốn đầu tư', prop: 'vondautu', mwidth: '150' },
        { key: 'giaban', label: 'Giá bán', prop: 'giaban', mwidth: '150' },
        { key: 'giathue', label: 'Giá thuê', prop: 'giathue', mwidth: '150' },
      ],
      data: [],
      loading: false,
      success: false,
      stateSave: false,
      tableNewKey: {
        'Loại dự án': 'project_type',
        'Tên dự án': 'title',
        'Tỉnh/Thành phố': 'provinceid',
        'Quận/Huyện': 'districtid',
        'Phường/Xã': 'wardid',
        'Địa chỉ': 'address',
        'Chủ đầu tư': 'chudautu',
        'Vốn đầu tư': 'vondautu',
        'Giá bán': 'giaban',
        'Giá thuê': 'giathue',
        'Diện tích xây dựng': 'dientichxd',
        'Thời gian xây dựng': 'thoigianxd',
        'Thời gian giao': 'thoigiangn',
        'Diện tích sử dụng': 'dientich',
        'Số phòng': 'sophong',
        'Số block': 'soblock',
        'Số tầng': 'sotang',
        'Số căn hộ': 'socanho',
        'Không gian xanh': 'khonggianxanh',
        'Mật độ xây dựng': 'matdo',
        'Phí quản lý': 'phiquanly',
        'Phí giữ oto': 'giuoto',
        'Phí giữ xe máy': 'giuxemay',
        'Danh sách nội thất': 'noithat',
        'Danh sách tiện ích': 'tienich',
        'Mô tả ngắn gọn': 'description',
        'Mô tả chi tiết': 'descriptionhtml',
        'Hình ảnh': 'image',
      },
      error: [],
      excelFile: '/themes/admin_default/images/excel-project-import.xlsx',
    }
  },
  methods: {
    goBackConponPage() {
      window.location.href =
        script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=projects'
    },
    isValidDate(d) {
      let date_regex = /(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$/
      return date_regex.test(d)
    },
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
        if (!newR.hasOwnProperty('title') || newR.title === '') {
          comp.error.push(`Lỗi: "Tên dự án" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`)
        }
        if (
          !newR.hasOwnProperty('provinceid') ||
          newR.provinceid === '' ||
          !newR.hasOwnProperty('districtid') ||
          newR.districtid === '' ||
          !newR.hasOwnProperty('wardid') ||
          newR.wardid === ''
        ) {
          comp.error.push(
            `Lỗi: "Tỉnh/Thành phố/Quận/Huyện/Phường/Xã" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${
              i + 2
            }.`
          )
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
        .post(
          script_name +
            '?' +
            nv_name_variable +
            '=' +
            nv_module_name +
            '&' +
            nv_fc_variable +
            '=projects-import&import=1',
          { data: jsonData }
        )
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
          } else {
            comp.stateSave = false
            comp.$message({
              message: resp.mess,
              duration: 6000,
              type: 'error',
            })
          }
        })
        .fail(() => {
          comp.stateSave = false
          comp.$message({
            message: 'Có lỗi xảy ra ở server, danh sách vẫn chưa được nhập.',
            duration: 6000,
            type: 'error',
          })
        })
    },
  },
}
</script>

<style lang="scss" module>
.ImportPage {
  min-height: 500px;
}

.InstructionWrap,
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
