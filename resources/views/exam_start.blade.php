<!doctype html>
<html>
<head>
  <title>Online Quiz</title>
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
  <style>
  .error{
  color: #FF0000; 
  }
  </style>
</head>
<body>
  <div class="container mt-4">
    <div class="card">
      <div class="card-header text-center font-weight-bold">
        <h2 id="heading_name">Start</h2>
      </div>
    <div class="card-body">
      <form name="userForm" id="userForm" method="post" action="javascript:void(0)">
      @csrf
        <div class="form-group">
          <label for="exampleInputEmail1">Name</label>
          <input type="text" id="name" name="name" class="form-control">
        </div>        
        <button type="submit" class="btn btn-primary" id="submit">Next</button>
      </form>

      <form name="questionForm" id="questionForm" method="post" action="javascript:void(0)">
      @csrf
        <div class="form-group" id="question_inputs">
          
        </div> 
        <div class="clearfix" id="skip_right">
          <button type="button" class="btn btn-primary" id="skip">Skip</button>
          <button type="submit" class="btn btn-primary pull-right" id="submit">Next</button>
        </div>
      </form>

    </div>
    </div>
  </div>    
<script>
$("#questionForm").hide();
if ($("#userForm").length > 0) {
  $("#userForm").validate({
      rules: {
        name: {
        required: true,
        maxlength: 50
        },   
      },
      messages: {
        name: {
        required: "Please enter name",
        maxlength: "Your name maxlength should be 50 characters long."
        },
      },
  submitHandler: function(form) {
    $.ajaxSetup({
      headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $('#submit').html('Please Wait...');
    $("#submit").attr("disabled", true);
    $.ajax({
      url: "{{url('user-data')}}",
      type: "POST",
      data: $('#userForm').serialize(),
      dataType: 'JSON',
      success: function( response ) {
        $("#userForm").hide();
        $("#questionForm").show();
        $("#heading_name").text(response.message);
        $("#question_inputs").html(response.data)        
      }
    });
}
})
}

// Questions form handlers of submit
if ($("#questionForm").length > 0) {
  $("#questionForm").validate({
      rules: {
        option_id: {
        required: true
        },   
      },
      messages: {
        option_id: {
        required: "Please choose option"
        },
      },
  submitHandler: function(form) {
    $.ajaxSetup({
      headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $('#is_skip').val('N');
    $('#submit').html('Please Wait...');
    $("#submit").attr("disabled", true);
    $.ajax({
      url: "{{url('question-data')}}",
      type: "POST",
      data: $('#questionForm').serialize(),
      dataType: 'JSON',
      success: function( response ) {
        if(response.message==='Result Page')
        {
          $("#skip_right").hide();
        }
        $("#questionForm").show();
        $("#heading_name").text(response.message);
        $("#question_inputs").html(response.data)        
      }
    });
}
})
}

// Question form handler of skip
$("#skip").click(function(){
  $('#is_skip').val('Y');
  $.ajaxSetup({
      headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $('#is_skip').val('Y');
    $('#submit').html('Please Wait...');
    $("#submit").attr("disabled", true);
    $.ajax({
      url: "{{url('question-data')}}",
      type: "POST",
      data: $('#questionForm').serialize(),
      dataType: 'JSON',
      success: function( response ) {
        if(response.message==='Result Page')
        {
          $("#skip_right").hide();
        }
        $("#questionForm").show();
        $("#heading_name").text(response.message);
        $("#question_inputs").html(response.data)        
      }
    });
}); 

</script>
</body>
</html>