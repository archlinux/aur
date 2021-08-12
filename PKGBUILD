# Maintainer: Devin Singh <drsingh2518 [at] icloud [dot] com>
pkgname=iosevka-serif
pkgver=0.1.0
pkgrel=1
pkgdesc='Serifed Iosevka build'
arch=('any')
url='https://github.com/devins2518/iosevka-serif'
license=('MIT')
makedepends=('git')
source=("git+https://github.com/devins2518/iosevka-serif.git")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    find . -iname "*.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}
