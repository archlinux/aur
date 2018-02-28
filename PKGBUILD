# Maintainer: iboyperson <iboyperson@gmail.com>

pkgname=osx-arc-aurorae-theme
reponame=OSX-Arc-Aurorae
pkgver=1.0.0
pkgrel=1
pkgdesc="An Aurorae theme designed to compliment @LinxGem33's OSX-Arc gtk themes"
arch=('x86_64')
url="https://github.com/iboyperson/OSX-Arc-Aurorae"
license=('GPL 3.0')
depends=('kwin')
source=("https://github.com/iboyperson/OSX-Arc-Aurorae/archive/1.0.0.tar.gz")
sha256sums=('28e1e6f13bcc524b7714e0bab0b1817601f477196fbff905066f3eb2aefeef9a')

package() {
    mkdir -p "$pkgdir/usr/share/aurorae/themes"
    cp -r "${srcdir}/${reponame}-${pkgver}/OSX-Arc" "${pkgdir}/usr/share/aurorae/themes/"
    cp -r "${srcdir}/${reponame}-${pkgver}/OSX-Arc-Dark" "${pkgdir}/usr/share/aurorae/themes/"
}
