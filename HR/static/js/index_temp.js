$(function () {
    $('img').each(function () {
        var img_path = $(this).attr('src')

        img_path = img_path.substring(3,img_path.length)

        console.log(img_path)

        img_path = "{% static '" + img_path + "' %}"

        $(this).attr('src',img_path)
    })
    console.log($('body').html())
})