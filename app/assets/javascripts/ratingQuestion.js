

$('#plus').one('click', function() {
    var sp = parseFloat($(this).next('div').text());
    var rating = sp+1;
    $(this).next('div').text(rating);
    var questionId = $(this).attr('data-question-id');
    $.ajax({
        method: "POST",
        url: "/questions/rating",
        data: { 'questionId': questionId, 'rating': rating }
    })

});

$('#minus').one('click', function() {
    var sp = parseFloat($(this).prev('div').text());
    var rating = sp-1;
    $(this).prev('div').text(rating);
    var questionId = $(this).attr('data-question-id');
    $.ajax({
        method: "POST",
        url: "/questions/rating",
        data: { 'questionId': questionId, 'rating': rating }
    })
});




/*

var zeroValue = 0;
    $('#plus').click(function(){
        zeroValue += 1;
        $("#value").text(zeroValue);
    });
    $('#minus').click(function(){
        zeroValue -= 1;
        $("#value").text(zeroValue);
    });
    $("#value").text(zeroValue);

*/

















