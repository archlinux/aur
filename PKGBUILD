# Maintainer: Yurii Kolesnykov <root at yurikoles {dot} com>
# Contributor: Karel Louwagie <aur at karellouwagie {dot} net>
# Contributor: Samuel Walladge <samuel at swalladge {dot} id {dot} au>

pkgname=toggldesktop-beta-bin
_pkgname=toggldesktop
pkgver=7.4.443
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
	'toggldesktop.deb::https://toggl.com/api/v8/installer?app=td&platform=deb64&channel=beta')

sha512sums=('ef7d7478eed416d36d0bd39f533fa60c681b6594419d8c5cf6d5ab0595b97957665f0bfbbb60f4ba6215f2b54175055b19294d78a3ac922ac70dca4e3ae85516')

prepare() {
  tar -xf data.tar.xz
}

package() {
  cp -a "$srcdir/usr/" "${pkgdir}"
}
