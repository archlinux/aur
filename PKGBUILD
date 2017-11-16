# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=amar-installer
pkgver=1.0
pkgrel=2
pkgdesc="Install AMAR repository"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=('gksu' 'tk' 'python-pillow')
source=("amar.py"
        "amar.png"
        "amar.desktop")
sha256sums=('2032a352c85fc9945bc0b3cb7fd5cde97b7eeb239cc2235e8fa3585029fe2af0'
            '874700067f446dff59f8e4e6c3b14519ca8afdf31742af629343c80002c71376'
            '0f2f75e7aaf1375b14570067563330f438e2a20158642b76c16a4ff4a8bb3158')

package() {
	install -Dm644 "amar.desktop" "${pkgdir}/usr/share/applications/amar.desktop"
        install -Dm644 "amar.py" "${pkgdir}/usr/bin/amar.py"
        install -Dm644 "amar.png" "${pkgdir}/usr/share/icons/amar.png"
} 

