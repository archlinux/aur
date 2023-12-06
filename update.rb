#!/usr/bin/env ruby
require "httparty"
require "colorize"

# Possible values: ca1 usa10 usa11 usa13 usa14 uk3 uk5 germany4 germany5 germany6 france3
SERVER = "germany4"

PKGBUILD = File.read("PKGBUILD")
old_version = PKGBUILD.split(/\n/).find{|l|  l.start_with? "pkgver="}.split("=").last

abort "Version detected as #{old_version.inspect.red} which does not match the format, quitting" if !/\d+\.\d+\.\d+/.match? old_version

puts "Version detected in PKGBUILD is #{old_version.blue}"

print "Requesting current version...\r"
res = HTTParty.get(
	"https://www.visual-paradigm.com/downloads/vpce/Visual_Paradigm_CE_Linux64.sh",
	follow_redirects: false,
)

url = res.headers[:location]

version = url.match(/.*\/Visual_Paradigm_CE_(\d+)_(\d+)_(\d+)_Linux64\.sh/).captures.join(".")

puts "The current version is #{version == old_version ? version.blue : version.green}"

abort "Same version, quitting" if version == old_version


puts "Downloading and hashing new file..."

download_url = "https://www.visual-paradigm.com/downloads/#{SERVER}/vpce/Visual_Paradigm_CE_Linux64_InstallFree.tar.gz"

length = HTTParty.head(download_url).headers["Content-Length"].to_i

collected = 0

digest = Digest::SHA256.new

HTTParty.get(download_url, stream_body: true) do |frag|
	collected += frag.length
	digest << frag
	percentage = (collected.to_f/length * 100).round
	print "[#{('#' * (percentage / 2)).ljust 50, ' '}] #{percentage.round.to_s.rjust 2, '0'}% (#{(length/10**6).round 1}Mb)\r"
end

puts "The new hash is #{digest.hexdigest.green}" + " " *20

PKGBUILD_FILE = File.open "PKGBUILD", "w"

for line in PKGBUILD.lines
	if line.start_with? "pkgver="
		PKGBUILD_FILE.puts "pkgver=#{version}"
	elsif line.start_with? "pkgrel="
		PKGBUILD_FILE.puts "pkgrel=1"
	elsif line.start_with? "sha256sums=('"
		PKGBUILD_FILE.puts "sha256sums=('#{digest.hexdigest}'"
	else
		PKGBUILD_FILE << line
	end
end

puts "Updated PKGBUILD"
