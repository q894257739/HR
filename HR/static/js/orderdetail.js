$(function () {
    $('#alipay').click(function () {
        request_data = {
            'identifier':$('#oid').attr('identifier')
        }

        $.get('/pay/',request_data,function (response) {
            if (response.status ==1){
                window.open(response.alipayurl,target='_self')
            }
        })
    })
})