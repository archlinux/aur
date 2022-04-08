# AUR User: This file exists to aid the package maintainer and is not needed to
# build or to run the package.

require 'mixlib/install'

# Upstream source options
chefio_options = {
  channel: :stable,
  product_name: 'chef-workstation',
  platform: "ubuntu",
  platform_version: "18.04",
  architecture: "x86_64"
}

# Release struct used to model a new release
Release = Struct.new(:version, :url, :sha256, keyword_init: true)
release = nil

task default: [:build]

task prep: [:clean, :vet] do
  sh 'rm -rf Gemfile.lock'
  sh 'bundle install'
end

task :clean do
  sh 'git clean -fd'
  sh 'rm -rf pkg src *.deb *.tar.xz'
end

task vet: [:namcap, :shellcheck]

task :namcap do
  sh 'namcap PKGBUILD'
end

task :shellcheck do
  sh 'shellcheck PKGBUILD'
end

task :lookup_current_release do
  artifact = Mixlib::Install.new(chefio_options).artifact_info

  if ! artifact.version
    puts "Unable to get release info from Chef.io"
    exit(1)
  end

  release = Release.new({
    version: artifact.version,
    url: artifact.url,
    sha256: artifact.sha256
  })
end

task update_pkgbuild: [:lookup_current_release] do
  pkgbuild = File.read 'PKGBUILD'

  pkgbuild.split("\n").each do |line|
    if line =~ /pkgver=(.*)/
      if $1 == release.version
        puts "#{$1}: This version is already current!"
        exit 1
      end

      File.write '.commit_msg', "#{$1} → #{release.version}"
 
      break
    end
  end

  pkgbuild = pkgbuild
    .gsub(/pkgver=.*/, "pkgver=#{release.version}")
    .gsub(/source=.*/, "source=('#{release.url}')")
    .gsub(/sha256sums=.*/, "sha256sums=('#{release.sha256}')")

  File.write 'PKGBUILD', pkgbuild
end

task build: [:prep, :update_pkgbuild] do
  sh 'makepkg'
  sh 'makepkg --printsrcinfo > .SRCINFO'
end

file commit: ['.commit_msg'] do
  sh 'echo "Committing: "'
  sh 'cat .commit_msg'
  sh 'git add .SRCINFO'
  sh 'git add PKGBUILD'
  sh 'git commit -S -s -F .commit_msg'
  sh 'rm .commit_msg'
end

