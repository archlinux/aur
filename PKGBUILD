# Maintainer: Yurii Kolesnykov <root at yurikoles {dot} com>
# Contributor: Karel Louwagie <aur at karellouwagie {dot} net>
# Contributor: Samuel Walladge <samuel at swalladge {dot} id {dot} au>

pkgname=toggldesktop-dev-bin
_pkgname=toggldesktop
pkgver=7.4.528
pkgrel=1
pkgdesc="Time Tracking Software."
arch=('x86_64')
provides=('toggldesktop')
conflicts=('toggldesktop')
depends=(
	'gst-plugins-base'
	'gstreamer'
	'jsoncpp'
	'libqxt'
	'libxss'
	'lua'
	'poco'
	'qt5-base'
	'qt5-declarative'
	'qt5-webengine'
	'qt5-x11extras')
url='https://toggl.com/'
source=(
	"https://github.com/toggl/toggldesktop/releases/download/v${pkgver}/toggldesktop_${pkgver}_amd64.deb")

sha512sums=('d15b3801cd7eae8af245b2b57f42d510fe4b0e0a8e9c3f7a2e67fc253e3bbc04c86a56e955e0addb398447d4f08035f1cdfbf239849341a8ce7bae1ed368ebef')

prepare() {
  tar -xf data.tar.xz
}

package() {
  cp -a "$srcdir/usr/" "${pkgdir}"
}
