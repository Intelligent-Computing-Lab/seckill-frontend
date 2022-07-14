<template>

<el-main>
  <div id="shuru">
  <el-form :model="user1" label-width="120px">
    <el-form-item label="Name">
      <el-input placeholder="请输入产品名字" v-model="user1.product_name" />
    </el-form-item>

    <el-form-item label="Status">
      <el-input placeholder="状态" v-model="user1.status" clearable/>
    </el-form-item>

    <el-form-item label="Total" >
      <el-input placeholder="请输入产品总数" v-model="user1.total" clearable/>
    </el-form-item>

    <el-form-item>
      <el-button type="primary" @click="submit">Submit</el-button>
    </el-form-item>

  </el-form>
  </div>
</el-main>

   
 
</template>



<script lang="ts" setup>

import { reactive } from "vue"
import axios from "axios"
const user1 = reactive({
    product_name:'',
    status:'',
    total:''
})

const user2 = reactive({
    product_name:'',
    status:1,
    total: 0
})

const submit = () => {
    user2.product_name = user1.product_name.toString()
    user2.status = parseInt(user1.status)
    user2.total = parseInt(user1.total)
    axios.post('http://49.233.111.31:80/admin/product/create',user2)
       .then((res) => {
        if(res&&res.status == 200)
           console.log(res)
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