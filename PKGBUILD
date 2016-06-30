# Maintainer: yubimusubi
pkgname=('3dsconv')
provides=('3dsconv')
pkgver=2.2
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
     'e3c2e53af358bc77726b533dcf01e790f718891cc0157deb7dfb3657637cc719'
)

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/bin/"
    install "3dsconv.py" "$pkgdir/usr/bin/3dsconv"
}
