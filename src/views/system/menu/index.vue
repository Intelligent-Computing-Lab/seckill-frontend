<template>
  <el-table :data="tableData.list" height="600px" border>
    <el-table-column prop="product_id" label="ID"></el-table-column>
    <el-table-column prop="product_name" label="Name"  />
    <!-- <el-table-column prop="status" label="status"  /> -->
    <el-table-column prop="total" label="total" />
  </el-table>
  <!-- {{tableData.list}} -->
</template>

<script lang="ts" setup>
import { onMounted, reactive } from "vue";
import axios from "axios"


const tableData = reactive({
	list:[]
})


const getTableList = () =>{
	axios.get('http://49.233.111.31:80/admin/product/list')
	.then((res)=>{
       console.log(res)
	   tableData.list = res.data.result
	}).catch((err)=>{
       console.log(err)
	})

	

}

onMounted(()=>{
   getTableList()
})

</script>

<style lang="scss" scoped>

</style>
