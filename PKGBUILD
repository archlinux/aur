# Maintainer: yubimusubi
pkgname=('3dsconv')
provides=('3dsconv')
pkgver=3.21
pkgrel=1
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
     '264bf0ce38c97f2d0bd97ebc50e650eb6ec2096340f391ce5d0bcb26d58e48eb'
)

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/bin/"
    install "3dsconv.py" "$pkgdir/usr/bin/3dsconv"
}
