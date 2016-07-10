# Maintainer: yubimusubi
pkgname=('3dsconv')
provides=('3dsconv')
pkgver=3.0
pkgrel=1
pkgdesc='Tool to convert Nintendo 3DS CTR Cart Image files (CCI, ".3ds") to the CTR Importable Archive format (CIA).'
arch=('any')
url="https://github.com/ihaveamac/3dsconv"
license=('MIT')
depends=('projectctr-makerom-git' 'python2') #FIXME preferably projectctr-makerom-git should have "makerom" in "provides"
makedepends=('tar')
options=('!strip')

source=(
    "https://github.com/ihaveamac/3dsconv/archive/v$pkgver.tar.gz"
)

sha256sums=(
     '4149839ea6c922f9dacf22d2b5f8374ca265391c7b3b1f3044139e2ca5790fb4'
)

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/bin/"
    install "3dsconv.py" "$pkgdir/usr/bin/3dsconv"
}
