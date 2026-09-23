# Maintainer: Valentin Weber
pkgname="rapidraw-tethering-bin"
pkgver=1.6.4
pkgrel=1
pkgdesc="GPU-accelerated RAW image editor with tethering support"

url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('libgphoto2' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'dbus' 'libsoup3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libgcc' 'libstdc++' 'glibc') 
provides=("rapidraw")
conflicts=("rapidraw")

sha256sums=('2bb1bd7ae57e76e06dfda94833dd834340b25618d3493ce88f040b20a2270427')

_ubuntuver=24.04
_debfile="03_tethering_RapidRAW_v${pkgver}_ubuntu-${_ubuntuver}"

source=("$url/releases/download/v${pkgver}/${_debfile}_amd64.deb")

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
