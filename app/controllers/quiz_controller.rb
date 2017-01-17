class QuizController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def task
    st=Time.now
    case id = params["id"]
    when 1
      answer = $hash_lines[Unicode::downcase(params["question"].del_punc)]
    when 2
      answer = $data_s[x.del_dunc.split("%WORD%", -1).map{|y| y.split(' ')}]
    end
    res=""
    if answer
      parameters = {
        answer: answer,
        token: "d905e2e9fb13c49669a2da323533b09d",
        task_id:  params["id"]
      }
      res=Net::HTTP.post_form(ADDR, parameters)
    end
    render json: 'ok'
    task = Question.new params["question"], params["id"],params["level"], (Time.now - st)
    task.message = res.body
    $tasks << task
    puts res.body
  end

end
