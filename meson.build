gobject = dependency('gobject-2.0')
gio = dependency('gio-2.0')
gthread = dependency('gthread-2.0')
libalpm = dependency('libalpm')
json = dependency('json-glib-1.0')
libsoup = dependency('libsoup-2.4')
polkit = dependency('polkit-gobject-1')
#libnotify = dependency('libnotify')
appstream = dependency('appstream-glib')

# gtk3 = dependency('gtk+-3.0', version : '>=3.22')
# gdk3 = dependency('gdk-3.0')
# gdk_pixbuf2 = dependency('gdk-pixbuf-2.0')
# vte3 = dependency('vte-2.91')

posix = meson.get_compiler('vala').find_library('posix')
math = meson.get_compiler('c').find_library('m')

vala_deps = [gobject]
alpm_deps = [libalpm, gio, posix]

alpm_c_args = ['-D_FILE_OFFSET_BITS=64']

common_vala_args = ['--pkg=posix', '--target-glib=2.38', '--vapidir=' + join_paths(meson.source_root(), 'vapi')]
common_c_args = ['-DGETTEXT_PACKAGE="pamac"']

common_sources = ['common.vala', 'package.vala', 'alpm_package.vala', 'pamac_config.vala']
# transaction_gtk_sources = ['transaction-gtk.vala', 'choose_provider_dialog.vala', 'choose_pkgs_dialog.vala', 'transaction_sum_dialog.vala', 'progress_box.vala']
# preferences_sources = ['preferences_dialog.vala']

libpamac_sources = [common_sources, 'alpm_config.vala', 'aur.vala', 'database.vala', 'transaction_interface.vala', 'alpm_utils.vala', 'transaction_interface_root.vala', 'daemon_interface.vala', 'transaction_interface_daemon.vala', 'transaction.vala']
libpamac_dependencies = [alpm_deps, math, json, appstream, libsoup]

if get_option('enable-snap')
	snapd = dependency('snapd-glib')
	gmodule = dependency('gmodule-2.0')

	libpamac_snap = library('pamac-snap',
		sources: ['snap_interface.vala', 'snap_plugin.vala', 'package.vala'],
		vala_args: common_vala_args,
		c_args: common_c_args,
		dependencies: [gio, math, snapd, gmodule],
		install: true,
		install_dir: [true, true, true])

	common_vala_args += '--define=ENABLE_SNAP'
	libpamac_sources += ['plugin_loader.vala', 'snap_interface.vala']
	libpamac_dependencies += gmodule
endif

libpamac = library('pamac',
	sources: libpamac_sources,
	dependencies: libpamac_dependencies,
	vala_args: common_vala_args,
	c_args: [common_c_args, alpm_c_args],
	vala_gir: 'Pamac-9.0.gir',
	install: true,
	install_dir: [true, true, true, true])

# create pkg-config file
pkg = import('pkgconfig')
pkg.generate(libpamac,
	description: 'Pamac Library')

# create typelib files
g_ir_compiler = find_program('g-ir-compiler')
custom_target('pamac typelib', command: [g_ir_compiler, '--shared-library', 'libpamac', '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'Pamac-9.0.gir')],
	output: 'Pamac-9.0.typelib',
	depends: libpamac,
	install: true,
	install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))

libpamac_dep = declare_dependency(link_with: libpamac)

executable('pamac-daemon',
	sources: ['common_daemon.vala', 'alpm_utils.vala', 'alpm_config.vala', 'daemon.vala'],
	dependencies: [vala_deps, alpm_deps, json, math, libsoup, polkit, appstream, libpamac_dep],
	vala_args: common_vala_args,
	c_args: [common_c_args, alpm_c_args],
	install : true)

executable('pamac',
	sources: ['version.vala', 'transaction-cli.vala', 'cli.vala'],
	dependencies: [gio, posix, math, libpamac_dep],
	vala_args: [common_vala_args, '--pkg=linux'],
	c_args: common_c_args,
	install: true)

# executable('pamac-tray',
# 	sources: ['tray.vala', 'tray-gtk.vala'],
# 	dependencies: [gtk3, libnotify, libpamac_dep],
# 	vala_args: common_vala_args,
# 	c_args: common_c_args,
# 	install: true)

# if get_option('enable-appindicator')
# 	appindicator = dependency('appindicator3-0.1')
# 	executable('pamac-tray-appindicator',
# 		sources: ['tray.vala', 'tray-appindicator.vala'],
# 		dependencies: [gtk3, libnotify, appindicator, libpamac_dep],
# 		vala_args: common_vala_args,
# 		c_args: common_c_args,
# 		install: true)
# endif

# libpamac_gtk = library('pamac-gtk',
# 	sources: [transaction_gtk_sources, transaction_resources],
# 	dependencies: [gio, gtk3, vte3, libnotify, posix, math, libpamac_dep],
# 	vala_args: common_vala_args,
# 	c_args: common_c_args,
# 	install: true,
# 	install_dir: [true, true, true])

# libpamac_gtk_dep = declare_dependency(link_with: libpamac_gtk)

# executable('pamac-manager',
# 	sources: ['version.vala', 'history_dialog.vala', preferences_sources, 'local_config.vala', 'package_row.vala', 'manager_window.vala', 'manager.vala', 'search-provider.vala', manager_resources],
# 	dependencies: [gtk3, libsoup, libpamac_dep, libpamac_gtk_dep],
# 	vala_args: common_vala_args,
# 	c_args: common_c_args,
# 	install: true)

# executable('pamac-installer',
# 	sources: ['progress_dialog.vala', 'installer.vala', installer_resources],
# 	dependencies: [gtk3, libpamac_dep, libpamac_gtk_dep],
# 	vala_args: common_vala_args,
# 	c_args: common_c_args,
# 	install: true)
