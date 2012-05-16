<!-- BEGIN: FOOTER -->
  <script src="js/jquery.min.js"></script>
  <script src="{PHP.cfg.themes_dir}/admin/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript">
    $(function(){
      setTimeout(function(){
        $('.alert.alert-success').animate({
          opacity: 0,
          height: 0
        }, 'slow');
      }, 5000);
      <!-- IF {PHP.m} == 'users' -->
      $('input[name=rskiprights]').click(function(){
        if ($(this).val() == 1){
          $('select[name=rcopyrightsfrom]').attr('disabled', 'disabled');
        } else {
          $('select[name=rcopyrightsfrom]').removeAttr('disabled');
        }
      });
      <!-- ENDIF -->
      <!-- IF {PHP.m} == 'extrafields' -->
      var options = [];
      
      $('#extf_type_select').hide();
      $('#extf_type_range').hide();
      
      $('#extf_field_type').change(function() {
        options = [];
        updateOptions();
        var val = $(this).val();
        if (val == 'input' || val == 'textarea') {
          $('#extf_type_text').show();
        } else {
          $('#extf_type_text').hide();
        }
        if (val == 'select' || val == 'checkbox' || val == 'checklistbox' || val == 'radio') {
          $('#extf_type_select').show();
        } else {
          $('#extf_type_select').hide();
        }
        if (val == 'range') {
          $('#extf_type_range').show();
        } else {
          $('#extf_type_range').hide();
        }
      });
      $('#newoption').click(function(e){
        e.preventDefault();
        var newopt = $('input[name=newoption]').val();
        if (newopt) {
          options.push(newopt);
          updateOptions();
        }
        $('input[name=newoption]').val('');
      });
      $('a.removeoption').live('click', function(e){
        e.preventDefault();
        var opt = $(this).siblings('span:first').text();
        options.splice(options.indexOf(opt), 1);
        updateOptions();
      });
      function updateOptions(){
        $('#options').html('');
        $.each(options, function(i){
          $('#options').append('<li><a href="#" class="removeoption"><i class="icon-remove"></i></a> <span>'+options[i]+'</span></li>');
        });
        $('#extf_field_variants').val(options.toString());
      }
      <!-- ENDIF -->
    });
  </script>
</body>
</html>
<!-- END: FOOTER -->