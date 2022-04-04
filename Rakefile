task default: [:build]

task prep: [:clean, :namcap] do
  sh 'rm -rf Gemfile.lock'
  sh 'bundle install'
  # Fetches latest version info, updates
  # PKGBUILD, and creates a .commit_msg
  sh 'bundle exec ruby update.rb'
end

task build: [:prep] do
  sh 'makepkg'
  sh 'makepkg --printsrcinfo > .SRCINFO'
end

# .commit_msg is created by update.rb,
# if there is a new version.
file commit: ['.commit_msg'] do
	sh 'echo "Committing: "'
	sh 'cat .commit_msg'
	sh 'git add .SRCINFO'
	sh 'git add PKGBUILD'
	sh 'git commit -S -s -F .commit_msg'
	sh 'rm .commit_msg'
end

task :clean do
  sh 'git clean -fd'
  sh 'rm -rf pkg src *.deb *.tar.xz'
end

task :namcap do
	sh 'namcap PKGBUILD'
end

# too many failures we can't correct due to PKGBUILD design
task :shellcheck do
  sh 'shellcheck PKGBUILD'
end

task vet: [:namcap, :shellcheck]
