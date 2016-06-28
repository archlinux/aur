task :info  do; sh "makepkg --printsrcinfo > .SRCINFO"; end
task :build do; sh "makepkg"; end

desc "build package in info file"
task :default => [:build,:info]
