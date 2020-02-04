require 'mixlib/install'
require 'json'

options = {
  channel: :stable,
  product_name: 'chef-workstation',
  platform: "ubuntu",
  platform_version: "18.04",
  architecture: "x86_64"
}

artifact = Mixlib::Install.new(options).artifact_info
pkgbuild = File.read("PKGBUILD")
pkgbuild.split("\n").each do |line|
  if  line =~ /pkgver=(.*)/
    puts "#{$1} → #{artifact.version}"
    if $1 == artifact.version
      puts "This version is already current!"
      exit 1
    end
    break
  end
end

pkgbuild = pkgbuild.gsub(/pkgver=.*/, "pkgver=#{artifact.version}").
  gsub(/sha256sums=.*/, "sha256sums=('#{artifact.sha256}')").
  gsub(/source=.*/, "source=('#{artifact.url}')").
  gsub(/arch=.*/, "arch=('#{artifact.architecture}')")

File.open("PKGBUILD", "w") { |f| f.write(pkgbuild) }
