# Maintainer: yubimusubi
pkgname=('3dsconv')
provides=('3dsconv')
pkgver=3.2
pkgrel=2
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
     '5ab3fd2653316431be503d84ae986a386ea7113691668d2fbada758831f2d3f9'
)

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/bin/"
    install "3dsconv.py" "$pkgdir/usr/bin/3dsconv"
}
