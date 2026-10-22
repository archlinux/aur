# Maintainer: Valentin Weber
pkgname="rapidraw-tethering-bin"
pkgver=1.6.6
pkgrel=1
pkgdesc="GPU-accelerated RAW image editor with tethering support"

url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('libgphoto2' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3' 'dbus' 'libsoup3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libgcc' 'libstdc++' 'glibc') 
provides=("rapidraw")
conflicts=("rapidraw")

sha256sums=('dc49e21073006db59f4a2220c35023f246cc15d3cbd1774af2e360377211d8e5')

_ubuntuver=24.04
_debfile="03_tethering_RapidRAW_v${pkgver}_ubuntu-${_ubuntuver}"

source=("$url/releases/download/v${pkgver}/${_debfile}_amd64.deb")

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
