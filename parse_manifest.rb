#!/usr/bin/ruby

# Jiri build system uses jiri to checkout its dependencies :(
# https://fuchsia.googlesource.com/manifest/+/refs/heads/master/jiri
# to avoid this chicken-egg problem we parse the manifest and generate
# the dependencies that easy to use in the PKGBUILD file

require 'open-uri'
require 'xmlsimple'

deps = []

doc = XmlSimple.xml_in(open('https://raw.githubusercontent.com/fuchsia-mirror/manifest/master/jiri'))
for pr in doc['projects'][0]['project']
  name = pr['name']
  remote = pr['remote']
  rev = pr['revision']
  path = pr['path']

  url = "git+#{remote}"
  url += "#commit=#{rev}" if rev

  deps << [url, remote, path]
end

puts "Sources:"
for d in deps
  puts "  #{d[0]}"
end

puts "Prepare:"
for d in deps
  url, remote, path = *d

  puts "  mkdir -p #{File.dirname(path)}"
  puts "  rm -rf #{path}"
  puts "  ln -sfT $srcdir/#{File.basename(remote)} #{path}"
end
