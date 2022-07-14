<template>
  <el-main>
    <div id="shuru">
  <el-form :model="user1" label-width="120px">

    <el-form-item label="Product_ID">
      <el-input placeholder="请输入产品ID" v-model="user1.product_id" clearable/>
    </el-form-item>

    <el-form-item label="Activity_Name" >
      <el-input placeholder="请输入活动名称" v-model="user1.activity_name" clearable/>
    </el-form-item>
    <el-form-item label="Total">
      <el-input placeholder="请输入产品总数" v-model="user1.total" clearable/>
    </el-form-item>

    <el-form-item label="Start_Time">
      <el-input placeholder="请输入活动开始时间" v-model="user1.start_time" clearable/>
    </el-form-item>

    <el-form-item label="End_Time" >
      <el-input placeholder="请输入活动结束时间" v-model="user1.end_time" clearable/>
    </el-form-item>

    <el-form-item label="speed" >
      <el-input placeholder="请输入当前活动状态" v-model="user1.speed" clearable/>
    </el-form-item>

    <el-form-item label="Buy_Limit" >
      <el-input placeholder="请输入活动结束时间" v-model="user1.buy_limit" clearable/>
    </el-form-item>

    <el-form-item label="Buy_Rate" >
      <el-input placeholder="请输入当前活动状态" v-model="user1.buy_rate" clearable/>
    </el-form-item>

    <el-form-item>
      <el-button @click="submit" type="primary">Submit</el-button>
    </el-form-item>

  </el-form>
  </div>
</el-main>
  <!-- {{tableData.list}} -->
</template>

<script lang="ts" setup>
import { reactive } from "vue"
import axios from "axios"
const user1 = reactive({
  product_id:'',
  activity_name:'',
  total:'',
  start_time:'',
  end_time:'',
  speed:'',
  buy_limit:'',
  buy_rate:''
})
const user2 = reactive({
  product_id: 1,
  activity_name:'',
  total:0,
  start_time: 0,
  end_time:0,
  speed:1,
  buy_limit:1,
  buy_rate:0.2
})
const submit = () =>{
    user2.product_id = parseInt(user1.product_id) 
    user2.activity_name = user1.activity_name.toString()
    user2.total = parseInt(user1.total) 
    user2.start_time = parseInt(user1.start_time) 
    user2.end_time = parseInt(user1.end_time) 
    user2.speed = parseInt(user1.speed) 
    user2.buy_limit = parseInt(user1.buy_limit) 
    user2.buy_rate = parseInt(user1.buy_rate) 
    
    axios.post('http://49.233.111.31:80/admin/activity/create',user2)
    .then((res)=>{
      if(res&&res.status==200){
           console.log(res)
      }

    })
}

</script>

<style lang="scss" scoped>
  #shuru{
    // border:1px solid red;
    width: 800px;
    margin: auto;
    margin-top:30px ;
  }
  button{
    margin-left:250px;
    background-color: rgb(160, 15, 15);
  }
</style>
