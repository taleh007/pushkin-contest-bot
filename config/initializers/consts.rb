class Question
    attr_accessor :question
    attr_accessor :task_id
    attr_accessor :level
    attr_accessor :answer
    attr_accessor :resolve_time
    attr_accessor :message

    def initialize(question, task_id, level, resolve_time=0, answer="", message="")
      @question = question
      @task_id = task_id
      @level = level
      @answer = answer
      @resolve_time = resolve_time
      @message = message
    end
end

class NilClass
  def first
    nil
  end
  def last
    nil
  end
  def gsub(*a)
    nil
  end
end

class String
  def del_punc
    self.gsub(/[\~\!\@\#\$\%\^\&\*\(\)\_\+\`\-\=\№\;\?\/\,\.\/\;\'\[\]\\\|\{\}\:\"\<\>\? \—]/,"")
  end
  def del_dunc
    self.tr("«»\~\!\@\#\$\^\&\*\(\)\_\+\`\=\№\;\?\/\,\.\/\;\'\[\]\\\|\{\}\:\"\<\>\?\—","")
  end
end


data_a = JSON.parse File.read(File.expand_path("./db/poems-full.json") )
################################
################################
################################
#1
################################
$data_1={}
data_a.each{|x| x[1].each{|y|  $data_1[y.del_punc]= x[0] }}
# data_a.each{|x| x[1].each{|y|  $data_1[Unicode::downcase(y.del_punc)]= x[0] }}
################################
################################
#2-3-4
################################
$data_234 = {}
data_a.map{|x| x.last}.flatten.uniq.each do |x|
  str = x.del_dunc
  mas = str.split(' ')
  mas.each_with_index do |t, i|
    if $data_234[[mas[0...i], mas[(i+1)..-1]]]
      $data_234[[mas[0...i], mas[(i+1)..-1]]] = ([$data_234[[mas[0...i], mas[(i+1)..-1]]]] << t).flatten
    else
      $data_234[[mas[0...i], mas[(i+1)..-1]]] = t
    end
  end
end
################################
################################
#5
################################
$data_5 = {}
data_a.map{|x| x.last}.flatten.uniq.each do |x|
  str = x.del_dunc
  mas = str.split(' ')
  mas.each_with_index do |t, i|
    if $data_5[[mas[0...i], mas[(i+1)..-1]]]
      $data_5[[mas[0...i], mas[(i+1)..-1]]] = ([$data_5[[mas[0...i], mas[(i+1)..-1]]]] << [t,i]).flatten
    else
      $data_5[[mas[0...i], mas[(i+1)..-1]]] = [t, i]
    end
  end
end
################################
################################
#6-7
################################
$data_67={}
data_a.each{|x| x[1].each{|y| $data_67[y.del_punc.chars.sort]= y }}




################################
################################
#8
###############################
# $data_8={}
# data_a.map{|x| x.last}.flatten.uniq.each do |x|
#   str = x.del_punc
#   mas = str.chars.sort
#   mas.each_with_index do |t, i|
#     $data_8[[mas[0...i], mas[(i+1)..-1]].flatten] = x
#   end
# end
$data_8_={}
data_a.map{|x| x.last}.flatten.uniq.each do |x|
  mas = x.del_punc.chars
  $data_8_[mas.size]||={}
  $data_8_[mas.size][mas] = x
end







$tasks=[]
ADDR=URI("http://pushkin.rubyroidlabs.com/quiz")
class Solver
  def self.solve question

  end

  private
    def self.first_task

    end
end
