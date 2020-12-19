gobject = dependency('gobject-2.0')
gio = dependency('gio-2.0')
gthread = dependency('gthread-2.0')
libalpm = dependency('libalpm')
json = dependency('json-glib-1.0')
libsoup = dependency('libsoup-2.4')
polkit = dependency('polkit-gobject-1')
# libnotify = dependency('libnotify')
appstream = dependency('appstream-glib')
# gio_unix = dependency('gio-unix-2.0')

# gtk3 = dependency('gtk+-3.0', version : '>=3.22')
# gdk3 = dependency('gdk-3.0')
# gdk_pixbuf2 = dependency('gdk-pixbuf-2.0')

gmodule = dependency('gmodule-2.0')

posix = meson.get_compiler('vala').find_library('posix')
math = meson.get_compiler('c').find_library('m')

vala_deps = [gobject]
alpm_deps = [libalpm, gio, posix]

alpm_c_args = ['-D_FILE_OFFSET_BITS=64']

common_vala_args = ['--pkg=posix', '--target-glib=2.38', '--vapidir=' + join_paths(meson.source_root(), 'vapi')]
common_c_args = ['-DGETTEXT_PACKAGE="pamac"']

common_sources = ['package.vala', 'alpm_package.vala', 'pamac_config.vala']
# transaction_gtk_sources = ['transaction-gtk.vala', 'choose_provider_dialog.vala', 'choose_pkgs_dialog.vala',
# 							'transaction_sum_dialog.vala', 'progress_box.vala']
# preferences_sources = ['preferences_dialog.vala']

libpamac_sources = [common_sources, 'version.vala', 'alpm_config.vala', 'aur.vala', 'database.vala',
					'transaction_interface.vala', 'alpm_utils.vala', 'transaction_interface_root.vala',
					'daemon_interface.vala', 'transaction_interface_daemon.vala', 'transaction.vala',
					'updates_checker.vala', 'plugin_loader.vala', 'snap_interface.vala', 'flatpak_interface.vala']
libpamac_dependencies = [alpm_deps, math, json, appstream, libsoup, gmodule]
# libpamac_dependencies = [alpm_deps, math, json, appstream, libsoup, libnotify, gmodule]

if get_option('enable-snap')
	snapd = dependency('snapd-glib')

	libpamac_snap = library('pamac-snap',
		sources: ['snap_interface.vala', 'snap_plugin.vala', 'package.vala'],
		vala_args: common_vala_args,
		c_args: common_c_args,
		dependencies: [gio, math, snapd, gmodule],
		install: true,
		install_dir: [true, true, true])

	common_vala_args += '--define=ENABLE_SNAP'
endif

if get_option('enable-flatpak')
	flatpak = dependency('flatpak')

	libpamac_flatpak = library('pamac-flatpak',
		sources: ['flatpak_interface.vala', 'flatpak_plugin.vala', 'package.vala'],
		vala_args: common_vala_args,
		c_args: common_c_args,
		dependencies: [gio, math, flatpak, appstream, gmodule],
		install: true,
		install_dir: [true, true, true])

	common_vala_args += '--define=ENABLE_FLATPAK'
endif

libpamac = library('pamac',
	sources: libpamac_sources,
	dependencies: libpamac_dependencies,
	vala_args: common_vala_args,
	c_args: [common_c_args, alpm_c_args],
	vala_gir: 'Pamac-10.0.gir',
	install: true,
	install_dir: [true, true, true, true])

# create pkg-config file
pkg = import('pkgconfig')
pkg.generate(libpamac,
	description: 'Pamac Library')

# create typelib files
g_ir_compiler = find_program('g-ir-compiler')
custom_target('pamac typelib', command: [g_ir_compiler, '--shared-library', 'libpamac', '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'Pamac-10.0.gir')],
	output: 'Pamac-10.0.typelib',
	depends: libpamac,
	install: true,
	install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))

libpamac_dep = declare_dependency(link_with: libpamac)

daemon_sources = ['version.vala', 'package.vala', 'alpm_package.vala', 'aur.vala', 'alpm_utils.vala',
				'alpm_config.vala', 'pamac_config_daemon.vala', 'daemon.vala', 'plugin_loader.vala',
				'snap_interface.vala', 'flatpak_interface.vala']
daemon_dependencies = [vala_deps, alpm_deps, json, math, libsoup, polkit, appstream, gmodule]

executable('pamac-daemon',
	sources: daemon_sources,
	dependencies: daemon_dependencies,
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
#	sources: ['tray.vala', 'tray-gtk.vala'],
#	dependencies: [gtk3, libnotify, libpamac_dep],
#	vala_args: common_vala_args,
#	c_args: common_c_args,
#	install: true)

# libpamac_gtk = library('pamac-gtk',
#	sources: [transaction_gtk_sources, transaction_resources],
#	dependencies: [gio, gtk3, posix, math, libpamac_dep],
#	vala_args: common_vala_args,
#	c_args: common_c_args,
#	install: true,
#	install_dir: [true, true, true])

#libpamac_gtk_dep = declare_dependency(link_with: libpamac_gtk)

# executable('pamac-manager',
#	sources: ['version.vala', 'history_dialog.vala', 'updates_dialog.vala', preferences_sources, 'local_config.vala', 'package_row.vala', 'manager_window.vala', 'manager.vala', 'search-provider.vala', manager_resources],
#	dependencies: [gtk3, libsoup, gio_unix, libpamac_dep, libpamac_gtk_dep],
#	vala_args: common_vala_args,
#	c_args: common_c_args,
#	install: true)

# if get_option('enable-fake-gnome-software')
#	executable('gnome-software',
#		sources: ['fake_gnome_software.vala'],
#		dependencies: [gio],
#		install: true)
# endif

# executable('pamac-installer',
#	sources: ['progress_dialog.vala', 'installer.vala', installer_resources],
#  dependencies: [gtk3, gio_unix, libpamac_dep, libpamac_gtk_dep],
#	vala_args: common_vala_args,
#	c_args: common_c_args,
#	install: true)

executable('dependency-checker',
	sources: ['alpm_config.vala', 'dependency_checker.vala'],
	dependencies: [vala_deps, alpm_deps],
	vala_args: common_vala_args,
	c_args: [common_c_args, alpm_c_args],
	install : true)

executable('outdated-checker',
	sources: ['alpm_config.vala', 'outdated_checker.vala'],
	dependencies: [vala_deps, alpm_deps],
	vala_args: common_vala_args,
	c_args: [common_c_args, alpm_c_args],
	install : true)
