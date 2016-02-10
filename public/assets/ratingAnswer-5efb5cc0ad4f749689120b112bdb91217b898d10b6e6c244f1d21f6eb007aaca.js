
$('.buttonAnswerPlus').one('click', function() {
    var sp = parseFloat($(this).next('div').text());
    var rating = sp+1;
    $(this).next('div').text(rating);
    var answerId = $(this).attr('data-answer-id');
    $.ajax({
        method: "POST",
        url: "/answers/rating",
        data: { 'answerId': answerId, 'rating': rating }
    })

});


$('.buttonAnswerMinus').one('click', function() {
    var sp = parseFloat($(this).prev('div').text());
    var rating = sp-1;
    $(this).prev('div').text(rating);
    var answerId = $(this).attr('data-answer-id');
    $.ajax({
        method: "POST",
        url: "/answers/rating",
        data: { 'answerId': answerId, 'rating': rating }
    })
});


