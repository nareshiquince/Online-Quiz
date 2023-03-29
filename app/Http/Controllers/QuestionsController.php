<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Models\User;
use App\Models\Questions;
use App\Models\Results;

class QuestionsController extends Controller
{
    public function index()
    {
        return view('exam_start');
    }

    public function storeUser(Request $request)
    {
        $data_html='';
         
        $validatedData = $request->validate([
          'name' => 'required'
        ]);
 
        $user = User::firstOrNew(array('name' => $request->name));
        $user->save();

        if($request->session()->missing('user_id'))
        {
           $request->session()->put('user_id', $user->id);
        }        

        $question = Questions::find(1);
        $next_question_id = Questions::where('id', '>', $question->id)->min('id');

        $last_question_id = Questions::orderBy('id', 'DESC')->first();

        $question_options = Questions::find(1)->answers;
        $question_data=array();

        $data_html .='<p>'.$question->question.'</p>';
        $message = "Question ".$question->id;
        foreach($question_options as $qans)
        {
            $question_data['question']=$question->question;
            $question_data[]['options'] = $qans->options;

            $data_html .="<input type='radio' id='defaultRadio_". $qans->id ."' name='option_id' value=". $qans->id .">";
            $data_html .="<label for='defaultRadio_". $qans->id ."'>$qans->options</label><br>";
        }
            $data_html .="<input type='hidden' id='user_id' name='user_id' value=". $user->id .">";
            $data_html .="<input type='hidden' id='question_id' name='question_id' value=". $question->id .">";
            $data_html .="<input type='hidden' id='answer_option_id' name='answer_option_id' value=''>";
            $data_html .="<input type='hidden' id='is_skip' name='is_skip' value=''>";
            $data_html .="<input type='hidden' id='next_question_id' name='next_question_id' value=". $next_question_id .">";
            $data_html .="<input type='hidden' id='last_question_id' name='last_question_id' value=". $last_question_id->id .">";
        
        return response()->json(array(
            'success' => true,
            'data'   => $data_html,
            'message'=> $message
        )); 
         
    }

    public function storeshowQuestions(Request $request)
    {
        $data_html='';
        $message ='';
         
        $is_skip = $request->is_skip;
        $question_id = $request->question_id;

        if($is_skip !='Y')
        {
            $validatedData = $request->validate([
                'option_id' => 'required'
            ]);
        }

        $user_id = $request->session()->get('user_id');

        // code to insert the users answers
        $correct_answer = Questions::find($question_id)->answers
                                    ->where('answer', 'Y')
                                    ->first();
        
        $correct_option_id = $correct_answer->id;
        $user_selected_option_id = $request->option_id;

        if($is_skip=='Y')
        {
            $user_selected_option_id=null;
        }
        
        $is_correct = 'N';
        if($correct_option_id==$user_selected_option_id)
        {
            $is_correct = 'Y';
        }

        $result_array=array(
            'user_id'=>$user_id,
            'question_id'=>$question_id,
            'option_id'=>$user_selected_option_id,
            'is_skip'=>$is_skip,
            'is_correct'=>$is_correct
        );

        $result_data = Results::create($result_array);
        // insertion code ends here 

        $next_question_id = $request->next_question_id;
        $last_question_id = $request->last_question_id;

        if(!empty($next_question_id))
        {
            if($next_question_id <= $last_question_id)
        {
            $question = Questions::find($next_question_id);
            $last_question_id = Questions::orderBy('id', 'DESC')->first();       
            $question_options = Questions::find($next_question_id)->answers;

            $next_question_id = Questions::where('id', '>', $question->id)->min('id');
            $question_data=array();

            $data_html .='<p>'.$question->question.'</p>';
            $message = "Question ".$question->id;
            foreach($question_options as $qans)
            {
                $question_data['question']=$question->question;
                $question_data[]['options'] = $qans->options;

                $data_html .="<input type='radio' id='defaultRadio_". $qans->id ."' name='option_id' value=". $qans->id .">";
                $data_html .="<label for='defaultRadio_". $qans->id ."'>$qans->options</label><br>";
            }
                $data_html .="<input type='hidden' id='user_id' name='user_id' value=". $user_id .">";
                $data_html .="<input type='hidden' id='question_id' name='question_id' value=". $question->id .">";
                $data_html .="<input type='hidden' id='answer_option_id' name='answer_option_id' value=''>";
                $data_html .="<input type='hidden' id='is_skip' name='is_skip' value=''>";
                $data_html .="<input type='hidden' id='next_question_id' name='next_question_id' value=". $next_question_id .">";
                $data_html .="<input type='hidden' id='last_question_id' name='last_question_id' value=". $last_question_id->id .">";
        }else{
                $correct_answers = Results::where('user_id',$user_id)
                                ->where('is_correct','Y')
                                ->get()->count();

                $wrong_answers = Results::where('user_id',$user_id)
                                        ->where('is_correct','N')
                                        ->get()->count();

                $skip_answers = Results::where('user_id',$user_id)
                                        ->where('is_skip','Y')
                                        ->get()->count();              

                $message = "Result Page";

                $data_html .= "<p><span class='badge badge-success'>Correct Ans.</span>&nbsp;&nbsp;&nbsp;&nbsp;$correct_answers</p>";
                $data_html .= "<p><span class='badge badge-danger'>Wrong Ans.</span>&nbsp;&nbsp;&nbsp;&nbsp;$wrong_answers</p>";
                $data_html .= "<p><span class='badge badge-warning'>Skip Ans.</span>&nbsp;&nbsp;&nbsp;&nbsp;$skip_answers</p>";

                $request->session()->forget('user_id');
        }

        }else{
                $correct_answers = Results::where('user_id',$user_id)
                                ->where('is_correct','Y')
                                ->get()->count();

                $wrong_answers = Results::where('user_id',$user_id)
                                        ->whereNotNull('option_id')
                                        ->where('is_correct','N')
                                        ->get()->count();

                $skip_answers = Results::where('user_id',$user_id)
                                        ->where('is_skip','Y')
                                        ->get()->count();              

                $message = "Result Page";
                
                $data_html .= "<p><span class='badge badge-success'>Correct Ans.</span>&nbsp;&nbsp;&nbsp;&nbsp;$correct_answers</p>";
                $data_html .= "<p><span class='badge badge-danger'>Wrong Ans.</span>&nbsp;&nbsp;&nbsp;&nbsp;$wrong_answers</p>";
                $data_html .= "<p><span class='badge badge-warning'>Skip Ans.</span>&nbsp;&nbsp;&nbsp;&nbsp;$skip_answers</p>";

                $request->session()->forget('user_id');
        }
        
        return response()->json(array(
            'success' => true,
            'data'   => $data_html,
            'message'=> $message
        ));
        
    }
}
