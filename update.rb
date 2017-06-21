#!/usr/bin/env ruby

require 'net/http'

# carch: "x86_64" or "i686"
def path_for_version(version, carch="x86_64")
	"https://ftp.mozilla.org/pub/devedition/releases/#{version}/linux-#{carch}/de/firefox-#{version}.tar.bz2"
end

# Check current version.
pkgbuild = File.read "PKGBUILD"
current_version = /^pkgver=(.*)$/.match(pkgbuild)[1].to_s
puts "Current packaged version: #{current_version}"

def attempt_upgrade(version)
	# Check if the release actually exists (sometimes it's not included in the directory).
	uri = URI(path_for_version(version))
	puts "attempting upgrade (#{version}), checking: #{uri}"
	
	request = Net::HTTP.new uri.host
	response = request.request_head uri.path
	if response.code.to_i != 200
		return false
	end

	# Update PKGBUILD file.
	pkgbuild = File.read "PKGBUILD"
	pkgbuild.gsub!(/^pkgver=.*$/, "pkgver=#{version}")

	File.open "PKGBUILD", "w" do |file|
		file.write pkgbuild
	end
	
	true
end

# Update logic: Start with current version, alway incrementing the beta part by one and see if it exists, if yes
#	we perform an additional step if not we are happy with what we've found.
success = false
new_version = nil
v_num, v_patch = current_version.split("b")
loop do
	v_patch = v_patch.to_i + 1
	new_version = "#{v_num}b#{v_patch}"

	if attempt_upgrade(new_version)
		$new_version = new_version
		success = true
	else
		break
	end
end

if success
	puts "Finishing update to version #{$new_version}."

	# Clean old files.
	system "git clean -fx"

	# Update package sums & srcinfo.
	system "updpkgsums"
	system "mksrcinfo"

	# If run with --publish it will be uploaded to the remotes.
	if ARGV.include? "--publish"
		puts "Publishing update to AUR."
		system "git add PKGBUILD .SRCINFO"
		system "git commit -m 'Automatic upgrade to version #{$new_version}.'"
		system "git push"
	end
else
	puts "No update was available."
end

