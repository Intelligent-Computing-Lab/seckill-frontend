import request from '/@/utils/request';

export function fetchList(params?: object) {
    console.log("params",params)
    return request({
        url: '/oilprice/index',
        method: 'get',
        params
    })
}