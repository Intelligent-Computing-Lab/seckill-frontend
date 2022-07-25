<template>
  <el-main>
    <el-form :model="user1" :inline="true">
      <el-form-item>
        <el-input placeholder="产品名字" v-model="user1.product_name"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input placeholder="总数" v-model="user1.total" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-input placeholder="状态" v-model="user1.status" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="submit" type="primary">新增</el-button>
      </el-form-item>
    </el-form>



    <el-table
        :data="tableData.list"
        border
    >
      <el-table-column prop="product_id" label="ID">
      </el-table-column>
      <el-table-column prop="product_name" label="产品名字">
      </el-table-column>
      <el-table-column prop="status" label="状态">
      </el-table-column>
      <el-table-column prop="total" label="总数">
      </el-table-column>

    </el-table>
  </el-main>
   <!-- {{tableData.list}} -->
</template>
<script lang="ts" setup>
import {onMounted, reactive, ref} from 'vue'
import axios from "axios";



const tableData = reactive({
  list:[]
})
const getTableList = () => {
  axios.get('http://152.136.197.135:80/admin/product/list')
      .then((res)=>{
        console.log(res,'111111111111111111111111111111')
        tableData.list = res.data.result
      }).catch((err) =>{
    console.log(err)
  })
}
onMounted(()=>{
  getTableList()
})



const user1= reactive({
  product_name:'',
  status:'',
  total: ''
})
const user2= reactive({
  product_name:'',
  status: 1,
  total: 0
})
// 新增post
const submit =  () => {
  user2.product_name = user1.product_name.toString()
  user2.total = parseInt(user1.total)
  user2.status = parseInt(user1.status)
  axios.post('http://152.136.197.135:80/admin/product/create', user2).then((res) => {
    if (res && res.status == 200)
      console.log(res)
    // getTableList()
  })
}
</script>
<style lang="scss" scoped>

</style>