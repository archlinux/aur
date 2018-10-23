# Maintainer: iboyperson <iboyperson@gmail.com>

pkgname=osx-arc-aurorae-theme
_reponame=OSX-Arc-Aurorae
pkgver=1.1.0
pkgrel=1
pkgdesc="An Aurorae theme designed to compliment @LinxGem33's OSX-Arc gtk themes"
arch=('any')
url="https://github.com/iboyperson/OSX-Arc-Aurorae"
license=('GPL 3.0')
depends=('kwin')
source=("https://github.com/iboyperson/OSX-Arc-Aurorae/archive/$pkgver.tar.gz")
sha256sums=('8b112aa991225f2c56e3ee760b451d1af2f6ac352df9746dd5b20de8136c25cb')

package() {
    mkdir -p "$pkgdir/usr/share/aurorae/themes"
    cp -r "$srcdir/$_reponame-$pkgver/OSX-Arc" "$pkgdir/usr/share/aurorae/themes/"
    cp -r "$srcdir/$_reponame-$pkgver/OSX-Arc-Dark" "$pkgdir/usr/share/aurorae/themes/"
}
