# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=mato-icons
pkgver=0.9
pkgrel=1
pkgdesc="Mato is a Material Design inspired icon theme for Linux. It features simple and modern icons based on the official icons."
arch=('any')
url="https://flipflop97.github.io/Mato/"
license=('Creative Commons Attribution-ShareAlike 4.0 International Public License')
provides=('mato-icons')
source=("https://github.com/flipflop97/Mato/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "Mato-${pkgver}"
    install -dm 755 "${pkgdir}"/usr/share/icons
    mkdir "${pkgdir}"/usr/share/icons/Mato
    cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/icons/Mato
}
