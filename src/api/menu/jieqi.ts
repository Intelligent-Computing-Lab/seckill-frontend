import request from '/@/utils/request';

export function fetchList(params?: object) {
    console.log("params",params)
    return request({
        url: '/jieqi/index',
        method: 'get',
        params
    })
}