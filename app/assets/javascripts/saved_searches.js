$(document).ready(function() {
  /*  $("#new_saved_search").click(function() {
        //$('saved_searchs/form').trigger('submit.rails')
        $(this).submit();
    }
    );
    //$('#new_saved_search').hide().after('');
   */ 
   $("a").on("ajax:success", function(e, data, status, xhr){
   	//$(document).append(xhr.responseText)

   });
});