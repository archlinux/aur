# Maintainer: Colin Reeder <vpzomtrrfrt@gmail.com>
pkgname=tpac
pkgver=1.0rc2
_pkgver=1.0-rc2
pkgrel=1
pkgdesc="trizen wrapper to mimic yaourt's search feature"
arch=(any)
license=('MIT')
depends=('python>=3.6.0' 'trizen')

source=("https://github.com/romano21A/trizen-pac/archive/v${_pkgver}.tar.gz")
sha256sums=("589d703817d0704926070401ed06b1b9a2fc2aef23d31edba6f97a28460a085b")

package() {
	install -dm 755 "$pkgdir"/usr/bin/
	install -m 755 "trizen-pac-${_pkgver}/tpac" "$pkgdir"/usr/bin
}
