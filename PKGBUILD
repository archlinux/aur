# Maintainer: Luke Tuthill <lukemtuthill@gmail.com>
pkgname=mdn
pkgver=1.2
pkgrel=1
pkgdesc="Tool to manage markdown notes"
arch=("any")
url="https://github.com/lyneca/mdn"
license=('MIT')
source=("$pkgname::git+https://github.com/lyneca/mdn")
depends=('bash')
optdepends=('pandoc: pdf generation support')
sha1sums=('SKIP')

package() {
    cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
    install -Dm755 ./mdn $pkgdir/usr/bin/$pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
