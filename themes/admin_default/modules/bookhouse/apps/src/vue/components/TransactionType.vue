<template>
  <el-row>
    <el-form :inline="true">
      <el-form-item label="Ký hiệu Mã giao dịch">
        <el-input v-model="transaction_type" placeholder="Ký hiệu Mã giao dịch" :disabled="disabled"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button v-if="disabled" type="primary" icon="el-icon-edit" @click="handleEdit">Thay đổi</el-button>
        <el-button v-if="!disabled" type="success" icon="el-icon-check" @click="handleSave">Lưu lại</el-button>
        <el-button v-if="!disabled" type="danger" icon="el-icon-close" @click="handleClose">Hủy bỏ</el-button>
      </el-form-item>
    </el-form>
  </el-row>
</template>
<script>
import { transaction_type_update } from '@/api'
const { jQuery } = window

export default {
  name: 'TransactionType',
  data() {
    return {
      transaction_type: transaction_type,
      disabled: true,
    }
  },
  methods: {
    handleEdit() {
      this.disabled = false
    },
    handleClose() {
      this.disabled = true
    },
    handleSave() {
      const comp = this
      const jsonData = JSON.stringify(this.transaction_type)
      jQuery
        .post(transaction_type_update, { data: jsonData })
        .done(() => {
          this.disabled = true
          location.reload()
        })
        .fail(() => {
          comp.$message({
            message: 'Có lỗi xảy ra ở server.',
            duration: 6000,
            type: 'error',
          })
        })
    },
  },
}
</script>
