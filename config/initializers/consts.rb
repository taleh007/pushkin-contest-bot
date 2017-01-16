class Question
    attr_accessor :question
    attr_accessor :task_id
    attr_accessor :level
    attr_accessor :answer
    attr_accessor :resolve_time
    attr_accessor :created_at
    attr_accessor :updated_at

    def initialize(question, task_id, level, resolve_time=0, created_at=Time.now, updated_at=Time.now)
      @question = question
      @task_id = task_id
      @level = level
      @answer = ""
      @resolve_time = resolve_time
      @created_at = created_at
      @updated_at = updated_at
    end
end
class String
  def del_punc
    self.gsub(/[\~\!\@\#\$\%\^\&\*\(\)\_\+\`\-\=\№\;\?\/\,\.\/\;\'\[\]\\\|\{\}\:\"\<\>\? ]/,"")
  end
end

# binding.pry
data_a = JSON.parse File.read(File.expand_path("./db/poems-full.json") )
$hash_lines={}
data_a.each{|x| x[1].each{|y|  $hash_lines[Unicode::downcase(y.del_punc)]= x[0] }}

$tasks=[]
ADDR=URI("http://pushkin.rubyroidlabs.com/quiz")
class Solver
  def self.solve question

  end

  private
    def self.first_task

    end
end
