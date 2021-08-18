<template>
  <div v-loading="loading" :class="$style.ImportPage">
    <el-page-header title="Quay lại" content="Import File Excel" @back="goBackConponPage"></el-page-header>
    <div :class="$style.InstructionWrap">
      <el-alert
        :class="$style.Mb10"
        title="Mẫu file Excel import bất động sản:"
        type="info"
        show-icon
        :closable="false"
      >
        <a :class="$style.FileLink" :href="excelFile"><excel-icon />Danh sách bất động sản.xlsx</a>
      </el-alert>
      <el-alert title="Hướng dẫn:" type="info" show-icon>
        <p>
          <strong>Mã dự án, Hình thức, Loại bất động sản, Tên bất động sản:</strong> Bắt buộc nhập, không được để trống.
        </p>
        <p>
          <strong>Hình thức/Loại BĐS/Hướng/Pháp lý:</strong> Nhập chính xác in hoa in thường nếu sai dữ liệu sẽ không
          được nhập (ví dụ: Mua bán, Mua Bán, Đông, Tây, Sổ Đỏ).
        </p>
        <p>
          <strong>Tiện ích và Nội thất:</strong> Chỉ cần thêm số thứ tự của tiện ích, nội thất trong Menu Tiện ích, Nội
          thất. Mỗi tiện ích hoặc nội thất cách nhau bằng dấu phẩy (ví dụ: 1,2,3,4,5).
        </p>
        <p><strong>Hình ảnh:</strong> Sử dụng URL hình ảnh.</p>
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
        { key: 'title', label: 'Tên bất động sản', prop: 'title' },
        { key: 'address', label: 'Địa chỉ bất động sản', prop: 'address' },
        { key: 'price', label: 'Giá bán', prop: 'price' },
      ],
      data: [],
      loading: false,
      success: false,
      stateSave: false,
      tableNewKey: {
        'Mã dự án': 'projectid',
        'Hình thức': 'typeid',
        'Loại bất động sản': 'catid',
        'Tiêu đề': 'title',
        'Địa chỉ dự án': 'address',
        'Diện tích': 'area',
        'Giá bán': 'price',
        'Phòng khách': 'phong_khach',
        'Phòng ngủ': 'phong_ngu',
        'Phòng tắm': 'phong_tam',
        'Mặt tiền': 'front',
        'Đường vào': 'road',
        'Kết cấu': 'structure',
        Hướng: 'way',
        'Pháp lý': 'legal',
        'Họ và tên': 'contact_fullname',
        Email: 'contact_email',
        'Điện thoại': 'contact_phone',
        'Địa chỉ': 'contact_address',
        'Giới thiệu': 'hometext',
        'Chi tiết': 'bodytext',
        'Danh sách nội thất': 'noi_that',
        'Danh sách tiện ích': 'tien_ich',
        'Hình ảnh': 'homeimgfile',
      },
      error: [],
      excelFile: '/themes/admin_default/images/excel-realestate-import.xlsx',
    }
  },
  methods: {
    goBackConponPage() {
      window.location.href =
        script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=items'
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
          comp.error.push(
            `Lỗi: "Tên bất động sản" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`
          )
        }
        if (!newR.hasOwnProperty('projectid') || newR.projectid === '') {
          comp.error.push(`Lỗi: "Mã dự án" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`)
        }
        if (!newR.hasOwnProperty('catid') || newR.catid === '') {
          comp.error.push(
            `Lỗi: "Loại bất động sản" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`
          )
        }
        if (!newR.hasOwnProperty('typeid') || newR.typeid === '') {
          comp.error.push(`Lỗi: "Hình thức" không được để trống, vui lòng kiểm tra lại file Excel dòng số ${i + 2}.`)
        }
        // newR = mapValues(newR, (value, key) => {
        //   let newValue = String(value)
        //   return newValue
        // })
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
          script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=items-import&import=1',
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
