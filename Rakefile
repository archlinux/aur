task :info  do; sh "makepkg --printsrcinfo > .SRCINFO"; end
task :build do; sh "PKGEXT='.pkg.tar' makepkg"; end

desc "build package in info file"
task :default => [:info,:build]
