$("#plus").one("click",function(){var t=parseFloat($(this).next("div").text()),i=t+1;$(this).next("div").text(i);var a=$(this).attr("data-question-id");$.ajax({method:"POST",url:"/questions/rating",data:{questionId:a,rating:i}})}),$("#minus").one("click",function(){var t=parseFloat($(this).prev("div").text()),i=t-1;$(this).prev("div").text(i);var a=$(this).attr("data-question-id");$.ajax({method:"POST",url:"/questions/rating",data:{questionId:a,rating:i}})});