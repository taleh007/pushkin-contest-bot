class QuizController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def task
    st=Time.now
    case level = params["level"].to_i
    when 1
      answer = $hash_lines[Unicode::downcase(params["question"].del_punc)]
    when 2
      answer = $data_s[params["question"].del_dunc.split("%WORD%", -1).map{|y| y.split(' ')}]
    end
    res=""
    if answer
      parameters = {
        answer: answer,
        token: "d905e2e9fb13c49669a2da323533b09d",
        task_id:  params["id"]
      }
      res=Net::HTTP.post_form(ADDR, parameters)
      task = Question.new params["question"], params["id"],params["level"], (Time.now - st), answer, res.body
      $tasks << task
      render json: 'ok'
      puts res.body
    else
      render json: 'error'
    end
  end

end
