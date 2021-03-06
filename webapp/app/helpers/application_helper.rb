module ApplicationHelper

  PROLOG_COMMAND = "prolog"

  SCRIPT_DIR = './scripts/'
  EXERCISE_FILE = 'exercise.pl'

  def self.solve_prolog(consult_script, query, print)
    writelns = print.map { |x| "writeln(" + x + ")" }.join(",")

    full_query = [query, writelns].join(",").chomp ","

    `cd #{SCRIPT_DIR} && timeout -sKILL 300s #{PROLOG_COMMAND} -s #{consult_script} -g '#{full_query}' -t 'halt'`
  end

end
