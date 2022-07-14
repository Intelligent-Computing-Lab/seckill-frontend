<template>
	<el-main>
	<div>
  <el-card>
      <div id="shuru">
      <el-input 
        v-model="input.product_id"
        placeholder="product_id"
        clearable
      />
      <el-input
        v-model="input.source"
        placeholder="source"
        clearable
      />
      <el-input
        v-model="input.auth_code"
        placeholder="auth_code"
        clearable
      />
      <el-input
        v-model="input.sec_time"
        placeholder="sec_time"
        clearable
      />
      <el-input
        v-model="input.nance"
        placeholder="nance"
        clearable
      />
      <el-input
        v-model="input.user_id"
        placeholder="user_id"
        clearable
      />
      <el-input
        v-model="input.user_auth_sign"
        placeholder="user_auth_sign"
        clearable
      />
      <el-input
        v-model="input.access_time"
        placeholder="access_time"
        clearable
      />
      <el-input
        v-model="input.client_addr"
        placeholder="client_addr"
        clearable
      />
      <el-input
        v-model="input.client_refence"
        placeholder="client_refence"
        clearable
      />
    </div>
    <el-button @click="search">
      开始秒杀
    </el-button>
   <div id="title">秒杀结果</div>
    <div  id = "biaoge">
    <el-table
        :data="[shoplist]"
        border
    >
      <el-table-column
          prop="product_id"
          label="product_id"
      />
      <el-table-column
          prop="status"
          label="status"
      />
      <el-table-column
          prop="start"
          label="start"
      />
      <el-table-column
          prop="end"
          label="end"
      />
    </el-table>
    </div>
    <!-- {{shoplist}} -->
  </el-card>
</div>
	</el-main>
</template>

<script lang="ts" setup>
import { reactive, ref} from 'vue';
// import type { IProps } from '@/components/*.vue'
import axios from 'axios';
// import { watch } from 'fs';
let shoplist = ref([])
const input = reactive({
   product_id: "",
  source: "",
  auth_code: "",
  sec_time: "",
  nance: "",
  user_id: "",
  user_auth_sign: "",
  access_time: "",
  client_addr: "",
  client_refence: ""
})
const input1 =reactive({
  product_id: 1,
  source: "computer",
  auth_code: "auth_code",
  sec_time: 199340020360,
  nance: "nance",
  user_id: 1,
  user_auth_sign: "user_auth_sign",
  access_time: 20220224,
  client_addr: "127.0.0.1",
  client_refence: "localhost"
})
const search = () => {
  input1.product_id = parseInt(input.product_id)
  input1.source = input.source.toString()
  input1.auth_code = input.auth_code.toString()
  input1.sec_time = parseInt(input.sec_time)
  input1.nance = input.nance.toString()
  input1.user_id = parseInt(input.user_id)
  input1.user_auth_sign = input.user_auth_sign.toString()
  input1.access_time = parseInt(input.access_time)
  input1.client_addr = input.client_addr.toString()
  input1.client_refence = input.client_refence.toString()
  axios({
    method: 'post',
    url: 'http://49.233.111.31:80/app/sec/kill',
    data: input1
  }).then((res) => {
    console.log("111111")
    console.log(res.data)
    // shoplist.value = Array.from(res.data.result)
    shoplist.value = res.data.result
    console.log(shoplist.value)
  })
}
</script>
<style lang="scss" scoped>
// button{
//   margin-top: 15px;
//   margin-bottom: 300px;
//   margin-left: 550px;
//   background-color: aquamarine;
//   color: rgb(147, 101, 44);
// }
#shuru{
  // border: 1px solid black;
  height: 600px;
  width:600px;
  margin: auto;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
#biaoge{
  border: 1px solid white;

}
// #title{
//   // border: 1px solid black;
//   margin: auto;
//   width: 250px;
//   font-size: 50px;
//   color: brown;
//   margin-bottom: 10px;
//   font-family:YouYuan;

// }
button{
  margin-top: 15px;
  margin-bottom: 60px;
  margin-left: 550px;
  background-color: rgb(160, 15, 15);
  // color: rgb(147, 101, 44);
  color: white;
}
#title{
  // border: 1px solid black;
  margin: auto;
  width: 250px;
  font-size: 50px;
  color: rgb(160, 15, 15);
  margin-bottom: 30px;
  font-family:YouYuan;
  margin-top:20px ;
}
</style>