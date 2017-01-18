class QuizController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    puts "{ original_url => #{request.original_url}, ip => #{request.ip}"
  end

  def task
    st=Time.now
    answer=nil
    case level = params["level"].to_i
    when 1
      answer = $data_1[Unicode::downcase(params["question"].del_punc)]
    when 2
      answer = $data_234[params["question"].del_dunc.split("%WORD%", -1).map{|y| y.split(' ')}]
    when 3
      answer = params["question"].split("\n").map{|y| $data_234[y.del_dunc.split("%WORD%", -1).map{|y| y.split(' ')}]}.join(',')
    when 4
      answer = params["question"].split("\n").map{|y| $data_234[y.del_dunc.split("%WORD%", -1).map{|y| y.split(' ')}]}.join(',')
    when 5
      mas = params["question"].del_dunc.split(' ')
      mas.each_with_index do |t, i|
        if answer = $data_5[[mas[0...i], mas[(i+1)..-1]]]
          answer[-1]=t
          answer = answer.join(",")
          break
        end
      end
    when 6
      answer = $data_67[params["question"].del_punc.chars.sort]
    when 7
      answer = $data_67[params["question"].del_punc.chars.sort]
    when 8
      # mas = params["question"].del_punc.chars.sort
      # mas.each_with_index do |t, i|
      #   break if (answer = $data_8[[mas[0...i], mas[(i+1)..-1]].flatten])
      # end
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
      puts res
      puts answer.class
      render json: 'error'
    end
  end

end
