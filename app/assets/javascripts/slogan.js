$(document).ready(function() {

  $('#run').click(function(e) {
  
    var str = $('slogan').text();
    var rev = $.reverseString(str);
    
    $('slogan').text(rev);
  
  e.preventDefault();
  });


});

(function($) {


  $.reverseString = function(str) {
  
  
    if(typeof str !== 'string') {
      throw new Error('reverseString accepts only strings.');
      return;
    }
    
    var strArr = str.split('');
    var reversed = strArr.reverse();
    
    return reversed.join('');
  
  
  
  };


})(jQuery);