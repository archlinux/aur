# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=bashed
pkgver=20211020
pkgrel=1
pkgdesc='A command-line text editor, written in Bash'
arch=(x86_64)
url='https://github.com/justinyaodu/bashed'
license=(MIT)
depends=(bash)
makedepends=(git)
source=("git+$url#commit=638593272707795a19f11056a63ca226291c09f7")
b2sums=('SKIP')

package() {
    cd $pkgname
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
