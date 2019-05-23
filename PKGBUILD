# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.12.2
_oomox_theme_ver=1.10
_materia_theme_ver=20190315
#_materia_cmt=94da12f9c5dfa4e045f8f02e2c818891b13b0930
_arc_theme_ver=20190330
_archdroid_icons_ver=1.0.2
_gnome_colors_icons_ver=5.5.5
_oomoxify_ver=1.1.2
_base16_cmt=2e4112fe859ed5d33f67c177f11d369d360db9ae
_numix_icons_cmt=88ba3654506c73f77a28629d863d1e23a553bff7
_numix_folders_icons_cmt=24e5f6c6603e7f798553d2f24a00de107713c333
_papirus_icons_ver=20190521
_suru_plus_icons_ver=30.0
_suru_plus_aspromauros_icons_ver=2.1

pkgname=oomox
pkgver=${_oomox_ver}
pkgrel=5
pkgdesc='Themix: GUI for generating different color variations
of Arc, Materia, Oomox themes
(GTK2, GTK3, Cinnamon, GNOME, MATE, Openbox, Xfwm),
ArchDroid, Gnome-Colors, Numix, Papirus, Suru++ icons,
and terminal palettes.
Have a hack for HiDPI in GTK2.'
arch=('i686' 'x86_64')
url='https://github.com/themix-project/oomox'
license=('GPL3')
depends=(
	'gtk3'
	'python-gobject'
	'glib2'  # oomox, materia, arc
	'gdk-pixbuf2'  # oomox, materia, arc
	'gtk-engine-murrine'  # oomox, materia, arc
	'gtk-engines'  # oomox, materia, arc
	'gnome-themes-extra'  # materia
	'sassc'  # oomox, materia, arc
	'librsvg'  # oomox, gnome-colors
	'sed'  # oomox, materia, arc, gnome-colors, archdroid
	'findutils'  # oomox, materia, arc, gnome-colors, arch-droid
	'grep'  # oomoxify, oomox, materia, arc, gnome-colors
	'bc'  # oomoxify, oomox, materia, arc, gnome-colors
	'zip'  # oomoxify
	'polkit'  # oomoxify
	'imagemagick'  # gnome-colors
	'parallel'  # materia, arc
	'optipng'  # materia, arc
	'python-pillow'  # import_pil
	'python-pystache'  #  base16_format
	'python-yaml'  #  base16_format

	'resvg'  # materia, arc
	##or
	#'inkscape'  # materia, arc
)
optdepends=(
	'xorg-xrdb: for the `xresources` theme'
	'breeze-icons: more fallback icons'
	'gksu: for applying Spotify theme from GUI without polkit'
	'colorz: additional image analyzer for "Import colors from image" plugin'
	'python-colorthief: additional image analyzer for "Import colors from image" plugin'
	'python-haishoku: additional image analyzer for "Import colors from image" plugin'
)
options=(
    '!strip'
)
provides=('oomox')
conflicts=('oomox-git')
    # "materia-theme-v${_materia_theme_ver}.tar.gz::https://github.com/nana-4/materia-theme/archive/v${_materia_theme_ver}.tar.gz"
source=(
    "oomox-${_oomox_ver}.tar.gz::https://github.com/themix-project/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_oomox_theme_ver}.tar.gz::https://github.com/themix-project/oomox-gtk-theme/archive/${_oomox_theme_ver}.tar.gz"
    "materia-theme-${_materia_theme_ver}.tar.gz::https://github.com/nana-4/materia-theme/archive/v${_materia_theme_ver}.tar.gz"
    "arc-theme-${_arc_theme_ver}.tar.gz::https://github.com/NicoHood/arc-theme/archive/${_arc_theme_ver}.tar.gz"
    "archdroid-icon-theme-${_archdroid_icons_ver}.tar.gz::https://github.com/themix-project/oomox-archdroid-icon-theme/archive/${_archdroid_icons_ver}.tar.gz"
    "gnome-colors-icon-theme-${_gnome_colors_icons_ver}.tar.gz::https://github.com/themix-project/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_icons_ver}.tar.gz"
    "oomoxify-${_oomoxify_ver}.tar.gz::https://github.com/themix-project/oomoxify/archive/${_oomoxify_ver}.tar.gz"
    "base16_mirror-${_base16_cmt}.tar.gz::https://github.com/themix-project/base16_mirror/archive/${_base16_cmt}.tar.gz"
    "numix-icon-theme-${_numix_icons_cmt}.tar.gz::https://github.com/numixproject/numix-icon-theme/archive/${_numix_icons_cmt}.tar.gz"
    "numix-folders-${_numix_folders_icons_cmt}.tar.gz::https://github.com/numixproject/numix-folders/archive/${_numix_folders_icons_cmt}.tar.gz"
    "papirus-icon-theme-${_papirus_icons_ver}.tar.gz::https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/${_papirus_icons_ver}.tar.gz"
    "suru-plus-icon-theme-${_suru_plus_icons_ver}.tar.gz::https://github.com/gusbemacbe/suru-plus/archive/v${_suru_plus_icons_ver}.tar.gz"
    "suru-plus-aspromauros-icon-theme-${_suru_plus_aspromauros_icons_ver}.tar.gz::https://github.com/gusbemacbe/suru-plus-aspromauros/archive/v${_suru_plus_aspromauros_icons_ver}.tar.gz"
)
md5sums=('3dd791ab2cf30cc713657fc68d0b8e87'
         '13945f05eba3b85e6d63fec1ff60380a'
         '2bc1e31909bf1e6d966d64c82db21a97'
         '57c71dbdf05b6cfda073239ff322033c'
         'cb669130685dcbf03a8f7f5738c71dc6'
         '8b4a9a1837211a3caf661ab825d66cb0'
         '743395f8490fe7d2ec1525930f019d97'
         '8f7506b74131bfce78685aade0e275eb'
         '6873ed4ffd84e69e10625f5aee2bfdc6'
         '3fcb07cefe43a6a2fe4d977f124624ec'
         'f1729af8821c6fd1c592275ae1cddd67'
         'aba1a105215425e843b60b8edae38241'
         '852e3cb9292153fd55f8a5e79ce81ebe')

prepare() {
    cd ${srcdir}
    cp -pr "${pkgname}-gtk-theme-${_oomox_theme_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_oomox/gtk-theme"
    cp -pr "materia-theme-${_materia_theme_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    #cp -pr "materia-theme-${_materia_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "arc-theme-${_arc_theme_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_arc/arc-theme"
    cp -pr "archdroid-icon-theme-${_archdroid_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_archdroid/archdroid-icon-theme"
    cp -pr "gnome-colors-icon-theme-${_gnome_colors_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_gnomecolors/gnome-colors-icon-theme"
    cp -pr "oomoxify-${_oomoxify_ver}"/* "${pkgname}-${_oomox_ver}/plugins/oomoxify"
    cp -pr "base16_mirror-${_base16_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/base16/base16_mirror"
    cp -pr "numix-icon-theme-${_numix_icons_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/icons_numix/numix-icon-theme"
    cp -pr "numix-folders-${_numix_folders_icons_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/icons_numix/numix-folders"
    cp -pr "papirus-icon-theme-${_papirus_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_papirus/papirus-icon-theme"
    cp -pr "suru-plus-${_suru_plus_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_suruplus/suru-plus"
    cp -pr "suru-plus-aspromauros-${_suru_plus_aspromauros_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_suruplus_aspromauros/suru-plus-aspromauros"
}

package() {
    _oomox_dir="/opt/${pkgname}"
    _oomox_gui_dir="${_oomox_dir}/oomox_gui"

    cd "${srcdir}/${pkgname}-${_oomox_ver}"
    make DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install
    python -O -m compileall "${pkgdir}/${_oomox_gui_dir}" -d "${_oomox_gui_dir}"
}
