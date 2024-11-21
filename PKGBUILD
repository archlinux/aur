# Maintainer: Kimiblock Moe
pkgname=portable
pkgver=1.1.2
pkgrel=1
epoch=
pkgdesc="Portable Sandboxing framework"
arch=('any')
url="https://github.com/Kraftland/portable"
license=(GPL-3.0-or-later)
provides=(portable)
groups=()
options=(!debug !strip)

makedepends+=()

depends=(
	"xxd"
	"xorg-xauth"
	"xdg-user-dirs"
	"xorg-xhost"
	"findutils"
	"zenity"
	"xdg-dbus-proxy"
	"nss"
	"bubblewrap"
	"xcb-util-renderutil"
	"xcb-util-keysyms"
	"xcb-util-image"
	"xcb-util-wm"
	"libxkbcommon-x11"
	"libxkbcommon"
	"libxcb"
	"util-linux"
	"openssl-1.1"
	"libxcb"
	"gcc-libs"
	"nspr"
	"bzip2"
	"glibc"
	"zlib"
	"libxcomposite"
	"glib2"
	"wayland"
	"libxrender"
	"libxext"
	"alsa-lib"
	"dbus"
	"libxrandr"
	"fontconfig"
	"pango"
	"freetype2"
	"libxfixes"
	"cairo"
	"libx11"
	"expat"
	"at-spi2-core"
	"libxdamage"
	"libdrm"
	"mesa"
	"hicolor-icon-theme"
	"bash"
	"lsb-release"
	"psmisc"
	"wmctrl"
	"flatpak-xdg-utils"
	"xdg-desktop-portal"
	"xdg-desktop-portal-gtk"
)

optdepends=(
	'at-spi2-core: accessibility'
	'orca: screen reader'
)

makedepends+=(
	"libarchive"
)

checkdepends=()

source=(
	"portable.tar.gz"
)

function package() {
	cd "${srcdir}/portable-${pkgver}"
	install -Dm755 portable.sh ${pkgdir}/usr/bin/portable
	install -Dm755 open.sh ${pkgdir}/usr/lib/portable/open
	install -Dm755 user-dirs.dirs ${pkgdir}/usr/lib/portable/user-dirs.dirs
	install -Dm755 mimeapps.list ${pkgdir}/usr/lib/portable/mimeapps.list
	install -Dm755 flatpak-info ${pkgdir}/usr/lib/portable/flatpak-info
}
sha256sums=('7149e4877158d906313b45a21914737657149ebffd9131796bfa1b46dd1b83cf')
