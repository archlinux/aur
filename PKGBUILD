# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Samuel Walladge <samuel@swalladge.id.au>

pkgname=toggldesktop-dev-bin
_pkgname=toggldesktop
pkgver=7.4.504
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

sha512sums=('d9d774b8cad93b4d8cd07496179ade9789b2b978dde41fc2eef3c1afa0254c2bf8edce6f225e4fe7a4d38535a85c9ddb1003053d31993df210a9908ffe173dae')

prepare() {
  tar -xf data.tar.xz
}

package() {
  cp -a "$srcdir/usr/" "${pkgdir}"
}
