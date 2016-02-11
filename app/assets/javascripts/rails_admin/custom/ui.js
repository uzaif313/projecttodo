jQuery(function(){
      if($("a[href='/users/sign_out']").length > 0){
      $("a[href='/users/sign_out']").attr("href", "/admin/sign_out")
      }
 })
