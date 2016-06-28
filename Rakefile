file('.SRCINFO') do |t|
  sh "makepkg --printsrcinfo > #{t.name}"
end

task :build do |t|
  sh "makepkg"
end

task :default => [:build,'.SRCINFO']
