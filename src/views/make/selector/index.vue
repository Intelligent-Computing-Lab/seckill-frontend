<template>
	<el-main>
    <!-- <div>{{input}}</div> -->
	<div>
  <el-card>
    <div id="shuru">
      <el-input
        placeholder="ID"
        v-model="input.id"
        clearable
      />
      
    </div>
    <el-button @click="search">
      查询
    </el-button>
    <hr>
   
    <div id="title">商品信息</div>
    <el-table
        :data="[shoplist]"
        border
    >
      <el-table-column
          prop="product_id"
          label="ID"
      />
      <el-table-column
          prop="end_time"
          label="产品名字"
      />
      <el-table-column
          prop="status"
          label="状态"
      />
      <el-table-column
          prop="start_time"
          label="总数"
      />
    </el-table>
    <!-- {{shoplist}} -->


    <!-- {{a}} -->
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
   id:''
  })

const input1 = reactive({
   id:0
  })

const search = () => {
  input1.id = parseInt(input.id)
  axios({
    
    method: 'post',
    url: 'http://49.233.111.31:80/app/sec/info',
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
#shuru{
  // border: 1px solid black;
  height: 200px;
  width:600px;
  margin: auto;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  // border: 1px solid black;
  // background-color: rgb(212, 112, 112);
}
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