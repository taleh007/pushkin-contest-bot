class QuizController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def task
    st=Time.now
    # task = Question.new params["question"], params["id"],params["level"]
    # answer = $hash_lines[Unicode::downcase(task.question.del_punc)]
    answer = $hash_lines[Unicode::downcase(params["question"].del_punc)]
    # answer = $hash_lines[(task.question.del_punc.mb_chars.downcase.to_s)]
    # task.answer = answer
    # $tasks << task
    res=""
    if answer
      parameters = {
        answer: answer,
        token: "d905e2e9fb13c49669a2da323533b09d",
        task_id:  params["id"]
      }
      res=Net::HTTP.post_form(ADDR, parameters)
    end
    task = Question.new params["question"], params["id"],params["level"], (Time.now - st)
    task.answer = answer
    $tasks << task
    render json: 'ok'
    puts res.body
  end

end
