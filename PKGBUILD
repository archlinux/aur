# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=gnome40

# pkgver is for gnome-shell
pkgver=40.alpha.1.1
pkgrel=2

_gds_tag=40.alpha # desktop schemas
_mutter_tag=40.alpha.1.1 # mutter/clutter
_lgw_tag=40.alpha  # libgweather
_gse_tag=40.alpha.1  # shell-extensions
_gdu_tag=40.alpha  # disks utility
_gw_tag=40.alpha  # weather
_n_tag=40.alpha  # nautilus
_gsd_tag=40.alpha.1  # settings-daemon
_gd_tag=40.alpha  # desktop

# these repos have no tags :-/
_gvc_hash=7a621180b46421e356b33972e3446775a504139c  # volume control
_gss_hash=da0df35aabbc0a4aa30c874b2808808931e37608  # shell sass
_lgd_hash=8a68efc5bc2b4c3f24ad4a41b1656f8557bb8b44  # libgd
pkgdesc="A smattering of GNOME 40 prerelease projects, built from their latest tags"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME"
license=(GPL2)
depends=(
accountsservice
gcr
gjs
gnome-bluetooth
upower
gnome-session
gnome-settings-daemon
gnome-themes-extra
libcanberra-pulse
libgdm
libsecret
mutter
nm-connection-editor
unzip
gstreamer
libibus
gnome-autoar
gnome-disk-utility
gst-plugin-pipewire
dconf
gobject-introspection-runtime
libcanberra
startup-notification
zenity
libsm
gnome-desktop
libxkbcommon-x11
libgudev
libinput
pipewire
xorg-xwayland
graphene
glib2
cantarell-fonts
adobe-source-code-pro-fonts
libsoup
gtk4
geocode-glib
geoclue
libnm
libnotify
librsvg
libwacom
nss
pulseaudio
pulseaudio-alsa
systemd-libs
bubblewrap
iso-codes
libseccomp
libxkbfile
xkeyboard-config
)
makedepends=(
appstream-glib
python-gobject
gtk-doc
gnome-control-center
evolution-data-server
gobject-introspection
git
meson
sassc
asciidoc
bash-completion
egl-wayland
xorg-server
sysprof
vala
glade
js68
python-dbusmock
xf86-input-wacom
usbguard
python
libxslt
yelp-tools
)
conflicts=(
'gnome-shell'
'mutter'
'gsettings-desktop-schemas'
'libgweather'
'gnome-shell-extensions'
'gnome-disk-utility'
'gnome-weather'
'nautilus'
'libnautilus-extension'
'gnome-settings-daemon'
'gnome-desktop'
)
provides=(
'gnome-shell=40'
'mutter=40'
'gsettings-desktop-schemas=40'
'libgweather=40'
'libgweather-3.so=16-64'
'gnome-shell-extensions=40'
'gnome-disk-utility=40'
'gnome-weather=40'
'nautilus=40'
'libnautilus-extension=40'
'libnautilus-extension.so=1-64'
'gnome-settings-daemon=40'
'gnome-desktop=40'
'libgnome-desktop-3.so=19-64'
)
source=(
"gnome-shell-${pkgver}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-shell/-/archive/${pkgver}/gnome-shell-${pkgver}.tar.gz"
"gsettings-desktop-schemas-${_gds_tag}.tar.gz::https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/archive/${_gds_tag}/gsettings-desktop-schemas-${_gds_tag}.tar.gz"
"mutter-${_mutter_tag}.tar.gz::https://gitlab.gnome.org/GNOME/mutter/-/archive/${_mutter_tag}/mutter-${_mutter_tag}.tar.gz"
"libgnome-volume-control-${_gvc_hash}.tar.gz::https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/archive/${_gvc_hash}/libgnome-volume-control-${_gvc_hash}.tar.gz"
"libgweather-${_lgw_tag}.tar.gz::https://gitlab.gnome.org/GNOME/libgweather/-/archive/${_lgw_tag}/libgweather-${_lgw_tag}.tar.gz"
"gnome-shell-extensions-${_gse_tag}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-shell-extensions/-/archive/${_gse_tag}/gnome-shell-extensions-${_gse_tag}.tar.gz"
"gnome-shell-sass-${_gss_hash}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-shell-sass/-/archive/${_gss_hash}/gnome-shell-sass-${_gss_hash}.tar.gz"
"gnome-disk-utility-${_gdu_tag}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-disk-utility/-/archive/${_gdu_tag}/gnome-disk-utility-${_gdu_tag}.tar.gz"
"gnome-weather-${_gw_tag}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-weather/-/archive/${_gw_tag}/gnome-weather-${_gw_tag}.tar.gz"
"nautilus-${_n_tag}.tar.gz::https://gitlab.gnome.org/GNOME/nautilus/-/archive/${_n_tag}/nautilus-${_n_tag}.tar.gz"
"libgd-${_lgd_hash}.tar.gz::https://gitlab.gnome.org/GNOME/libgd/-/archive/${_lgd_hash}/libgd-${_lgd_hash}.tar.gz"
"gnome-settings-daemon-${_gsd_tag}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/archive/${_gsd_tag}/gnome-settings-daemon-${_gsd_tag}.tar.gz"
"gnome-desktop-${_gd_tag}.tar.gz::https://gitlab.gnome.org/GNOME/gnome-desktop/-/archive/${_gd_tag}/gnome-desktop-${_gd_tag}.tar.gz"
)
sha256sums=('6fa74238b4ff28b9ad34478c18062966df4bd237a9ce3a37167545e57155a2c7'
            '885170738e15afe1a4dc60b2b9c006fce37e2b220f26ecf35f13fec8ef84657e'
            '50c5e08bd53f67fed37b0de8adf0947a4a21083c85e1003aada49545e089bf43'
            '0bd8bb754ce3fb82b29c83e2186b2a84517be772acdba28d15eb928a44cadec3'
            'c8e797b59587109c9d49c46cf49a29d0c0705dc9cf365d6e89eb6e624aaa0b05'
            '708286741216011f7bf3b75388f7a1b51263e2dcc53939c7905a542c29adeb63'
            '0633eb407db1d4df30bbb7f4e870a3d631d7260d1fece7151e2bf381d843e4d1'
            'aed8c75832f0158560021f93fb68bcdbd347cd47d98a36125f48bdf5851e7330'
            '17e9f32282078a774af670d2b2bee3b3996684c81499fae1f1ed6488b0704f10'
            '06c8473be2cff69f9e92cab7da7100dbee03cdfa968a4775394aac41b2733ba0'
            'ee27f965bbc3a55111d736f08e69f480c5a7f9e86afb52f82cc8135aea7c62ab'
            '19f7232e41a1762d20cccc32c6b6d38b09c66604ee62ed2b4743796fc3558345'
            '23054e305d3261e859141c53f8b6e9ba16319c873ca8bf7e6a817d4e9e06b5b8')

prepare() {
  rm -rf gnome-shell-${pkgver}/subprojects/gvc
  ln -sf ../../libgnome-volume-control-${_gvc_hash} gnome-shell-${pkgver}/subprojects/gvc
  mkdir -p xdgdd/gir-1.0

  sed "s/^gsettings_desktop_schemas_req.*/gsettings_desktop_schemas_req = '>= 3.38.0'/g" -i mutter-40.alpha.1.1/meson.build

  rm -rf gnome-shell-extensions-${_gse_tag}/data/gnome-shell-sass
  ln -sf ../../gnome-shell-sass-${_gss_hash} gnome-shell-extensions-${_gse_tag}/data/gnome-shell-sass

  rm -rf nautilus-${_n_tag}/subprojects/libgd
  ln -sf ../../libgd-${_lgd_hash} nautilus-${_n_tag}/subprojects/libgd

  rm -rf gnome-settings-daemon-${_gsd_tag}/subprojects/gvc
  ln -sf ../../libgnome-volume-control-${_gvc_hash} gnome-settings-daemon-${_gsd_tag}/subprojects/gvc
}

build() {
  arch-meson gsettings-desktop-schemas-${_gds_tag} buildc
  meson compile -C buildc

  arch-meson libgweather-${_lgw_tag} buildd
  meson compile -C buildd

  arch-meson gnome-shell-extensions-${_gse_tag} builde -D extension_set=all -D classic_mode=true
  meson compile -C builde

  arch-meson gnome-disk-utility-${_gdu_tag} buildf
  meson compile -C buildf

  arch-meson gnome-weather-${_gw_tag} buildg
  meson compile -C buildg

  arch-meson nautilus-${_n_tag} buildh -D docs=true -D packagekit=false
  meson compile -C buildh

  arch-meson gnome-settings-daemon-${_gsd_tag} buildi
  meson compile -C buildi

  arch-meson gnome-desktop-${_gd_tag} buildj
  meson compile -C buildj

  arch-meson mutter-${_mutter_tag} builda -D egl_device=true -D wayland_eglstream=true
  meson compile -C builda

  export PKG_CONFIG_PATH="${srcdir}/builda/meson-private:${PKG_CONFIG_PATH}"
  export CPPFLAGS="${CPPFLAGS} -I../mutter-40.alpha.1.1/clutter -I../builda/clutter/clutter -I../mutter-40.alpha.1.1/cogl -I../builda/cogl -I../builda/cogl/cogl -I../builda/clutter -I../mutter-40.alpha.1.1/src -I../mutter-40.alpha.1.1/clutter/clutter -I../builda/src/meta -I../builda/src"
  export LDFLAGS="${LDFLAGS} -L../builda/cogl/cogl -L../builda/clutter/clutter -L../builda/src -L../builda/cogl/cogl-pango"
  export XDG_DATA_DIRS="${srcdir}/xdgdd:$XDG_DATA_DIRS"
  find . -name '*.gir' -exec ln -s ../../{} xdgdd/gir-1.0 \;
  arch-meson gnome-shell-${pkgver} buildb -D gtk_doc=True
  meson compile -C buildb 
}

package() {
  DESTDIR="$pkgdir" meson install -C builda
  DESTDIR="$pkgdir" meson install -C buildb
  DESTDIR="$pkgdir" meson install -C buildc
  DESTDIR="$pkgdir" meson install -C buildd
  DESTDIR="$pkgdir" meson install -C builde
  DESTDIR="$pkgdir" meson install -C buildf
  DESTDIR="$pkgdir" meson install -C buildg
  DESTDIR="$pkgdir" meson install -C buildh
  DESTDIR="$pkgdir" meson install -C buildi
  DESTDIR="$pkgdir" meson install -C buildj
}

