#!/usr/bin/ruby
file = File.expand_path("~/.pacsafe.conf")

trap("INT") { exit }
$stdout.sync = true #rsync "realtime" output

if File.file? file
  filelist = File.new(file, "r").lines.collect {|line| line.strip}
  filelist.delete("")
else
  filelist = Array.new
end

puts "building database...\n\n"
installedlist = `pacman -Qt 2>/dev/null`.split("\n").collect {|item| item.split(" ")[0]} + `pacman -Qdt 2>/dev/null`.split("\n").collect {|item| item.split(" ")[0]}

testlist = installedlist - filelist

keeplist = Array.new
prunelist = Array.new

i=0

while i < testlist.size
  item = testlist[i]
  system("pikaur -Qs \"^#{item.gsub("+", '\\\\\\\\\\\+')}$\" 2>/dev/null")
  print "(Yes/Prune/Skip/Info/Undo/eXit/Quit/Help) "

  begin
    system("stty raw echo")
    input = STDIN.getc.downcase
  ensure
    system("stty -raw echo")
  end

  case input
  when "y" then
    puts ": keeping #{item}"
    keeplist.push item
  when "p"
    puts ": deleting #{item}"
    prunelist.push item
  when "i"
    puts ": info"
    print `pikaur -Qi #{item}`
    i -= 1
  when "q", "\x03"
    puts ": quitting"
    exit
  when "x"
    puts ": exiting..."
    break
  when "u"
    puts ": undo"
    i -= 2
    keeplist.delete testlist[i+1]
    prunelist.delete testlist[i+1]
  when "s"
    puts ": skipping #{item}"
  when "h"
    puts ": help\n\nYes: Keep package and write it to pacsave.conf
Prune: Remove package with -Rsc (with dependencies)
Skip: Skip package for now, decide later
Info: Show more informations of the package
Undo: Undo the last choice, and ask again
eXit: Exit, remove marked packages and write pacsave.conf
Quit: Quit without writing pacsave.conf and removing packages
Help: Show this help"
    i -= 1
  else
    puts ": unknown command '#{input.chr}'"
    i -= 1
  end
  i += 1
  puts
end

if keeplist.size > 0 then
  puts "writing new keepers to #{file}..."
  File.open(file, "w") do |file|
    file.puts (filelist + keeplist).sort.join("\n")
  end
end

if prunelist.size > 0 then
  puts "removing package(s) #{prunelist.join(" ")}"
  system "pikaur -Rsc #{prunelist.join(" ")}"
end
