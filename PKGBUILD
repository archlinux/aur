# Maintainer: Valentin Weber
pkgname="rapidraw-tethering-bin"
pkgver=1.6.3
pkgrel=1
pkgdesc="GPU-accelerated RAW image editor with tethering support"

url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('libgphoto2') 
provides=("rapidraw")
conflicts=("rapidraw")

sha256sums=('851b436048b3b49898fdbd6e191621b9ff26e9c8b33949ff182597e5e2038c27')

_ubuntuver=24.04
_debfile="03_tethering_RapidRAW_v${pkgver}_ubuntu-${_ubuntuver}"

source=("$url/releases/download/v${pkgver}/${_debfile}_amd64.deb")

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
