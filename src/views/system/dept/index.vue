<template>
<!-- <button @click="getTableList">获取</button> -->
  <el-table :data="tableList.list" height="600px" border>
	  <el-table-column prop="activity_id" label="Activity_ID"></el-table-column>
    <el-table-column prop="product_id" label="Product_ID"></el-table-column>
    <el-table-column prop="activity_name" label="Activity_Name"  />
    <el-table-column prop="total" label="Total"  />
    <el-table-column prop="start_time_str" label="Start_Time"  />
    <el-table-column prop="end_time_str" label="End_Time" />
    <el-table-column prop="status_str" label="status" />
	
  </el-table>
  <!-- {{tableData.list}} -->
</template>

<script lang="ts" setup>
import { onMounted, reactive } from "vue"
import axios from "axios"

const tableList = reactive({
	list:[]
})
const getTableList = () => {
	axios.get('http://49.233.111.31:80/admin/activity/list')
	.then((res)=>{
		console.log(res)
		tableList.list = res.data.result
	})
}
onMounted(()=>{
	getTableList()
})

</script>

<style lang="scss" scoped>
// table{
//   // border: 1px solid black;
// }
</style>
