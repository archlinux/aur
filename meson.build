project('sigmavpn', 'c',
  version: '0.3alpha2',
  meson_version: '>=1.0',
  default_options: [
    'buildtype=debugoptimized',
    'b_ndebug=if-release',
    'c_std=gnu89',
  ],
)

config_path = get_option('prefix') / get_option('sysconfdir')
plugin_path = get_option('prefix') / get_option('libdir') / 'sigmavpn'

cc = meson.get_compiler('c')
add_project_arguments(
  cc.get_supported_arguments('-fcommon'),
  language: 'c',
)

libsodium_dep = dependency('libsodium')

executable('naclkeypair',
  'naclkeypair.c',
  dependencies: libsodium_dep,
  install: true,
)

executable('sigmavpn',
  'main.c',
  'modules.c',
  'types.c',
  'dep' / 'ini.c',
  c_args: [
    '-DPLUGIN_PATH="@0@"'.format(plugin_path),
    '-DCONFIG_PATH="@0@"'.format(config_path),
  ],
  dependencies: [libsodium_dep, dependency('dl')],
  install: true,
)

plugins = {
  'proto': ['raw', 'nacl0', 'nacltai'],
  'intf': ['dummy', 'tuntap', 'udp'],
}
foreach kind, items : plugins
  foreach name : items
    shared_module('@0@_@1@'.format(kind, name),
      kind / '@0@_@1@.c'.format(kind, name),
      dependencies: libsodium_dep,
      install_dir: plugin_path,
      install: true,
    )
  endforeach
endforeach

install_man('sigmavpn.1')
install_data('sigmavpn.conf', install_dir: config_path)
