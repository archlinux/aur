# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: corvolino <corvolino@archlinux.com.br>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=pidgin-latex
pkgver=1.5.0
pkgrel=1
pkgdesc="Small latex plugin for pidgin"
arch=(i686 x86_64)
url=http://sourceforge.net/projects/pidgin-latex/
license=(GPL)
depends=(pidgin texlive-core)
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.tar.gz)
sha256sums=('5885666363867630de3dcb426420b07f9efd2467f562127d3998cc190c939d3a')

build() {
    cd "$srcdir"/$pkgname/
    make
}

package() {
    cd "$srcdir"/$pkgname/
    make install PREFIX="$pkgdir/usr"
}
