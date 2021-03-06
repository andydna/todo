#!/usr/bin/env ruby

class Todo
  class << self

    def exec_vim
      exec "vim #{ File.expand_path(caller_locations.first.path) }"
    end

    def puts_list
      puts DATA.readlines
      exit
    end

    def add_new task
      DATA.send(:open, __FILE__, 'a') { |data| data.puts task }
    end
  end
end

unless ARGV.count.zero?
  what_i_was_told = ARGV.join(' ')
  Todo.puts_list if what_i_was_told.match(/\Alist/)
  Todo.exec_vim  if what_i_was_told.match(/\Aedit/)
  Todo.add_new      what_i_was_told
end

__END__
