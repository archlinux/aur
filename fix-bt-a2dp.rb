#!/usr/bin/env ruby

RUNNING_FILE = '/tmp/.fix-bt-a2dp.running'
USER_FILE = '/etc/.fix-bt-a2dp.user'
DEVICE_PROFILE_FILE = '/etc/.fix-bt-a2dp.device-profiles'
ROOT_UID = 0

if system("which notify-send &> /dev/null")
  def gui_notify(msg)
    puts "notify-send: #{msg}"
    `notify-send '#{msg}'`
  end
else
  def gui_notify(msg)
    puts "notify-send: #{msg}"
  end
end

def command_failed(name, stdout)
  if stdout.strip.empty?
    raise "#{name} failed"
  else
    raise "#{name} failed:\n#{stdout}"
  end
end

DEVICE_PROFILE_MAPPING =
  File.exist?(DEVICE_PROFILE_FILE) ? Hash[
    File.read(DEVICE_PROFILE_FILE).lines.map {|l| l.split('=') }
  ] : {}

def bluetoothctl_info_value(v)
  return true if v.downcase == 'yes'
  return false if v.downcase == 'no'
  v
end

def bluetoothctl_info(mac)
  Hash[
    `bluetoothctl info #{mac}`.lines.drop(1).map do |line|
      line.split(':', 2).map(&:strip)
    end.map do |k, v|
      [k.downcase.to_sym, v]
    end.group_by do |k, _v|
      k
    end.map do |k, v|
      if v.count == 1
        [k, bluetoothctl_info_value(v[0][1].to_s)]
      else
        [k, v.map {|vv| vv[1]}]
      end
    end
  ]
  # will return {} if dev of mac not found
end

def have_audio_sink?(uuid_values)
  uuid_value = uuid_values.kind_of?(Array) ? uuid_values.join : uuid_values
  uuid_value.to_s.downcase.gsub(' ', '').include?("audiosink")
end

def enable_a2dp(name, mac, bluez_mac, info)
  puts "enabling #{name}, mac: #{mac}"

  puts ">> bluetoothctl connect #{mac}"
  bluetoothctl_connect_out = `bluetoothctl connect #{mac}`
  unless $?.success? && bluetoothctl_connect_out.downcase.include?('successful')
    command_failed('bluetoothctl connect', bluetoothctl_connect_out)
  end

  sleep 1

  profile_name = DEVICE_PROFILE_MAPPING[name] || 'a2dp_sink'
  puts ">> pacmd set-card-profile bluez_card.#{bluez_mac} #{profile_name}"
  set_card_profile_out = `pacmd set-card-profile bluez_card.#{bluez_mac} #{profile_name}`
  unless $?.success? && set_card_profile_out == ''
    command_failed('pacmd set-card-profile', set_card_profile_out)
  end

  puts "a2dp enabled for #{name}!"
  gui_notify("#{name} connected and set to #{profile_name}")
end

def scan_enable_a2dp
  bt_devs = `bluetoothctl devices`
  command_failed('`bluetoothctl devices`', bt_devs) unless $?.success?

  pacmd_sinks = `pacmd list-sinks`
  command_failed('`pacmd list-sinks`', pacmd_sinks) unless $?.success?

  bt_sinks_no_a2dp = bt_devs.lines.map do |bt_dev_line|
    /^(\S+)\s(\S+)\s(.+)$/.match(bt_dev_line).to_a.drop(2)
  end.map do |mac, name|
    [name, mac, "#{mac.gsub(':', '_')}", bluetoothctl_info(mac)]
  end.keep_if do |name, mac, bluez_mac, info|
    !info.empty? &&
      info[:paired] &&
      info[:trusted] &&
      !info[:blocked] &&
      info[:connected] &&
      have_audio_sink?(info[:uuid]) &&
      !pacmd_sinks.include?("bluez_sink.#{bluez_mac}.a2dp_sink")
  end

  if bt_sinks_no_a2dp.empty?
    puts "No bluetooth devices with audio sink and without A2DP"
  else
    puts "Bluetooth devices with audio sink and without A2DP: #{bt_sinks_no_a2dp.map(&:first).join(', ')}"
    bt_sinks_no_a2dp.each do |name, mac, bluez_mac, info|
      begin
        enable_a2dp(name, mac, bluez_mac, info)
      rescue => e
        STDERR.puts e
      end
    end
    puts "done!"
  end
end

def main
  if File.exist?(RUNNING_FILE)
    puts "already running at pid #{File.read(RUNNING_FILE)} (#{RUNNING_FILE} exists)...exit"
    return 0
  end
  return_code = 1
  File.open(RUNNING_FILE, 'w') {|f| f.write(Process.pid.to_s) }
  puts "waiting for 5 seconds..."
  sleep 5

  begin
    scan_enable_a2dp
    return_code = 0
  rescue => e
    STDERR.puts e
  end

  `rm #{RUNNING_FILE}`
  return_code
end

if Process.uid == ROOT_UID
  if ARGV[0] == 'set-device-profile'
    `rm -f #{DEVICE_PROFILE_FILE}`
    name = ARGV[1]
    profile = ARGV[2]
    File.open(DEVICE_PROFILE_FILE, 'w') do |f|
      f.write(
        DEVICE_PROFILE_MAPPING
          .merge(name => profile)
          .to_a.map {|kv| kv.join('=')}.join("\n")
      )
    end
    exit 0
  elsif ARGV[0] == 'set-user'
    `rm -f #{USER_FILE}`
    user = ARGV[1].strip
    uid = `id -u #{user}`.strip
    xdg_runtime_dir = ENV['XDG_RUNTIME_DIR'] || "/run/user/#{uid}"
    File.open(USER_FILE, 'w') {|f| f.write("#{user}:#{xdg_runtime_dir}") }
    exit 0
  elsif Process.uid == ROOT_UID && File.exist?(USER_FILE)
    user, xdg_runtime_dir = File.read(USER_FILE).strip.split(':')
    puts ">> XDG_RUNTIME_DIR=#{xdg_runtime_dir} su #{user} -c #{__FILE__}"
    exec({'XDG_RUNTIME_DIR' => xdg_runtime_dir}, "su #{user} -c #{__FILE__}")
  else
    STDERR.puts "As root, please run this first:\n\t#{__FILE__} set-user [user]"
    exit 1
  end
else
  exit main
end
