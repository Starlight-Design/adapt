$(document).ready(function() {

    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $("form"); //Fields wrapper
    var add_button      = $(".stepping"); //Add button ID
    var num_steps				= $("#num_steps");
    
    var x = 1; //initlal text box count
    add_button.click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            wrapper.append('<div class="form-group col-md-8 col-md-offset-3"><label for="step_text">Steps</label><input type="text" class="width_control form-control"  id="step_text" placeholder="Enter step" name="step_text_'+x+'"></div>'); //add input box
        		num_steps.attr('value', x)
        }
    });
    
    wrapper.on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#loguser').on('click', function(e){
    e.preventDefault;
  });
});
