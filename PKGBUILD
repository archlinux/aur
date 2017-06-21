# Maintainer: yubimusubi
pkgname=('3dsconv')
provides=('3dsconv')
pkgver=4.1
pkgrel=0
pkgdesc='Tool to convert Nintendo 3DS CTR Cart Image files (CCI, ".3ds") to the CTR Importable Archive format (CIA).'
arch=('any')
url="https://github.com/ihaveamac/3dsconv"
license=('MIT')
depends=('python2')
optdepends=('python2-crypto: support for zerokey-encryption')
makedepends=('tar')
options=('!strip')

source=(
    "https://github.com/ihaveamac/3dsconv/archive/v$pkgver.tar.gz"
)

sha256sums=(
     'bacb1d19fbdd875cafce5302f594568c7766d8670ea932b363d6af7b1f5b5b07'
)

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/bin/"
    install "3dsconv.py" "$pkgdir/usr/bin/3dsconv"
}
