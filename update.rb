require 'mixlib/install'
require 'json'

options = {
  channel: :stable,
  product_name: 'chefdk',
  platform: "debian",
  platform_version: "9",
  architecture: "x86_64"
}

artifact = Mixlib::Install.new(options).artifact_info
pkgbuild = File.read("PKGBUILD")
pkgbuild.split("\n").each do |line|
  if  line =~ /pkgver=(.*)/
    if $1 == artifact.version
      puts "#{$1}: This version is already current!"
      exit 1
    end
    File.open(".commit_msg", "w") do |f|
      f.write("#{$1} → #{artifact.version}")
    end
    break
  end
end

pkgbuild = pkgbuild.gsub(/pkgver=.*/, "pkgver=#{artifact.version}").
  gsub(/sha256sums=.*/, "sha256sums=('#{artifact.sha256}')").
  gsub(/source=.*/, "source=('#{artifact.url}')").
  gsub(/arch=.*/, "arch=('#{artifact.architecture}')")

File.open("PKGBUILD", "w") { |f| f.write(pkgbuild) }
