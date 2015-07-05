#!/usr/bin/env ruby

require 'getoptlong'
require 'readline'
require 'singleton'
require 'yaml'

# Monkey-path the Array class.
class Array
  # ["foo", {"foo" => 1}].cleanup => [{"foo" => 1}]
  # If the key in a Hash element of an Array is also present as an element of
  # the Array, delete the latter.
  def cleanup
    array = self.dup
    self.grep(Hash).map(&:keys).flatten.each do |x|
      array.delete x
    end
    array
  end
end

# Class handles configuration parameters.
class FlagsConfig < Hash
  # This is a singleton class.
  include Singleton

  # Merges a Hash or YAML file (containing a Hash) with itself.
  def load config
    if config.class == Hash
      merge! config
      return
    end

    unless config.nil?
      merge_yaml! config
    end
  end

  # Merge Config Hash with Hash in YAML file.
  def merge_yaml! path
    merge!(load_file path) do |key, old, new|
      (old + new).uniq.cleanup if old.is_a? Array and new.is_a? Array
    end
  end

  # Load YAML file and work around tabs not working for identation.
  def load_file path
    YAML.load open(path).read.gsub(/\t/, '   ')
  rescue Psych::SyntaxError => e
    print path, ':', e.message.split(':').last, "\n"
    exit 1
  end
end

# A method to print a beautiful usage message.
def usage
  $stderr.puts <<EOF
#{File.basename($0)} [options] [filters]

  OPTIONS

    -c, --config     Override default configuration paths. Requires one
                     argument. Can contain globs (escape them in some shells
                     (zsh for example)). 
    -h, --help       This help.
    -p, --prepend    Do not change anything.
    -y, --yes        Non-interactive mode. Assume yes on questions.
    -x, --xattr      Sets the PaX flags through setfattr, underlying
                     filesystems need xattr support.

  FILTERS

    Only change flags for paths, which contain one of these filters as a string.

EOF
  exit 1
end

# This iterates each config entry (which matches the filters). It yields flags,
# entry, pattern and path of the config entry to the block code.
def each_entry config, filters
  config.each do |flags, entries|
    entries.each do |entry|
      # Distinguish easy (String) and complex (Hash) config entries.
      if entry.is_a? String
        pattern = entry
      elsif entry.is_a? Hash
        pattern = entry.keys.first
      end

      # Skip this entry, if its path pattern does not contain one of the
      # filters.
      # TODO Do this for every matching path.
      unless filters.empty?
        temp_filters = filters.dup
        temp_filters.keep_if do |filter|
          pattern.downcase.include? filter.downcase
        end
        next if temp_filters.empty?
      end

      # If this runs with sudo, the ~ (for the users home path) have to point to
      # the user who runs it, not to root.
      unless ENV['SUDO_USER'].nil?
        paths = File.expand_path pattern.gsub('~', '~' + ENV['SUDO_USER'])
      else
        paths = File.expand_path pattern
      end

      # Now yield for every matching path.
      Dir.glob(paths).each do |path|
        yield flags, entry, pattern, path
      end
    end
  end
end

# Trap SIGINT (ctrl+c)
trap(:INT) { exit 1 }

# Define the possible options.
options = GetoptLong.new(
  ['--config',  '-c', GetoptLong::REQUIRED_ARGUMENT],
  ['--help',    '-h', GetoptLong::NO_ARGUMENT],
  ['--prepend', '-p', GetoptLong::NO_ARGUMENT],
  ['--xattr',   '-x', GetoptLong::NO_ARGUMENT],
  ['--yes',     '-y', GetoptLong::NO_ARGUMENT],
)

# Initialize option variables.
new_configs = []
prepend = false
yes = false
xattr = false

# Set option variables.
begin
  options.each do |option, argument|
    case option
      when '--config'
        new_configs = Dir.glob argument
      when '--help'
        usage
      when '--prepend'
        prepend = true
      when '--xattr'
        xattr = true
      when '--yes'
        yes = true
    end
  end
rescue GetoptLong::InvalidOption => e
  usage
end

# Whatever is left over is a filter.
filters = ARGV

# Exit if we are not running with root privileges.
if Process.uid != 0
  $stderr << "Root privileges needed.\n"
  exit 1
end

# Either default config paths or overridden ones.
config_paths = if new_configs.empty?
  ['/etc/pax-flags/*.conf', '/usr/share/linux-pax-flags/*.conf']
else
  new_configs
end

# Initialize the singleton config object...
config = FlagsConfig.instance

# ... and load every config file.
config_paths.each do |path|
  Dir.glob(path).each do |file|
    config.load file
  end
end

# Helper text for simple entries.
puts <<EOF
Some programs do not work properly without deactivating some of the PaX
features. Please close all instances of them if you want to change the
configuration for the following binaries.
EOF

# Show every simple entry.
each_entry config, filters do |flags, entry, pattern, path|
  puts ' * ' + path if File.exists? path and entry.is_a? String
end

# Let us sum up the complex entries...
autopaths = []
each_entry config, filters do |flags, entry, pattern, path|
  if File.exists? path and entry.is_a? Hash
    autopaths.push path if not (entry.nil? and entry[path]['skip'])
  end
end

# ... to decide, if we need to print them.
unless autopaths.empty?
  puts <<EOF

For the following programs there are also changes neccessary but you do not have
to close or restart instances of them manually.
EOF

  autopaths.each do |path|
    puts ' * ' + path
  end
end

puts
puts 'Continue writing PaX headers? [Y/n]'

$stdout.flush

unless yes
  a = Readline.readline.chomp.downcase
  exit 1 if a.downcase != 'y' unless a.empty?
end

# Iterate each entry to actually set the flags.
each_entry config, filters do |flags, entry, pattern, path|
  if File.exists? path
    e = entry[pattern]
    actions = %w(status start stop)
    start_again = false

    # Get action commands from entries config.
    status = e['status']
    start  = e['start']
    stop   = e['stop']

    # If the type attribute is set to systemd, we set the action command
    # variables again but to systemd defaults.
    if e['type'] == 'systemd'
      name = e['systemd_name'] || File.basename(path)
      actions.each do |action|
        eval "#{action} = \"systemctl #{action} #{name}.service\""
      end
    end

    # If the entry is complex, stop it if it is running.
    if entry.is_a? Hash
      if status and system(status + '> /dev/null')
        system stop unless prepend
        start_again = true if start
      end
    end

    if xattr
      # setfattr seems to be picky about the order of the flags,
      # rearrange it beforehand
      xflags = flags[/[Pp]/] + flags[/[Ee]/] + flags[/[Mm]/] +
               flags[/[Rr]/] + flags[/[Ss]/]
      print xflags, ' ', path, "\n"
    else
      print flags, ' ', path, "\n"
    end

    # Set the flags and notify the user.
    unless prepend
      if xattr
        `setfattr -n user.pax.flags -v #{xflags} "#{path}"`
      else
        header = 'c'
        header = 'C' if e['header'] == 'create'
        `paxctl -#{header}#{flags} "#{path}"`
      end
    end

    # Start the complex entries service again, if it is neccessary.
    system start unless prepend if start_again
  end
end
