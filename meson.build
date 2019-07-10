libalpm = dependency('libalpm')
gio = dependency('gio-2.0')
json = dependency('json-glib-1.0')
appstream = dependency('appstream-glib')
libsoup = dependency('libsoup-2.4')
libcurl = dependency('libcurl')
gobject = dependency('gobject-2.0')

posix = meson.get_compiler('vala').find_library('posix')
math = meson.get_compiler('c').find_library('m')

vala_deps = [gobject]
alpm_deps = [libalpm, gio, posix]

alpm_vala_args = ['--vapidir=' + join_paths(meson.source_root(), 'vapi')]
alpm_c_args = ['-D_FILE_OFFSET_BITS=64']

common_vala_args = ['--pkg=posix', '--target-glib=2.38']
common_c_args = ['-DGETTEXT_PACKAGE="pamac"']

common_sources = ['common.vala', 'package.vala', 'pamac_config.vala']

libpamac = library('pamac',
	sources: [common_sources, 'error.vala', 'alpm_config.vala', 'aur.vala', 'database.vala', 'transaction_interface.vala', 'alpm_utils.vala', 'transaction_interface_root.vala', 'transaction_interface_daemon.vala', 'transaction.vala'],
	dependencies: [alpm_deps, math, json, appstream, libsoup, libcurl],
	vala_args: [common_vala_args, alpm_vala_args],
	c_args: [common_c_args, alpm_c_args],
	vala_gir: 'Pamac-8.0.gir',
	install: true,
	install_dir: [true, true, true, true])

# create pkg-config file
pkg = import('pkgconfig')
pkg.generate(libpamac,
	description: 'Pamac Library')

# create typelib files
g_ir_compiler = find_program('g-ir-compiler')
custom_target('pamac typelib', command: [g_ir_compiler, '--shared-library', 'libpamac', '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'Pamac-8.0.gir')],
	output: 'Pamac-8.0.typelib',
	depends: libpamac,
	install: true,
	install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))

libpamac_dep = declare_dependency(link_with: libpamac)

executable('pamac',
	sources: ['version.vala', 'transaction-cli.vala', 'cli.vala'],
	dependencies: [gio, posix, math, libpamac_dep],
	vala_args: [common_vala_args, '--pkg=linux'],
	c_args: common_c_args,
	install: true)
