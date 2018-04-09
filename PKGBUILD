# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=amar-installer
pkgver=1.5
pkgrel=2
pkgdesc="Install AMAR repository"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=('gksu' 'tk' 'python-pillow')
install=amar.install
source=("amar.py"
        "amar.png"
        "amar.desktop"
        "amar.conf")
sha256sums=('d54d10467391247f23c1ee07df0637c64378443847a7ec7ea9a9d5fe41f2f8d4'
            '874700067f446dff59f8e4e6c3b14519ca8afdf31742af629343c80002c71376'
            '0f2f75e7aaf1375b14570067563330f438e2a20158642b76c16a4ff4a8bb3158'
            'd8fafeb25a8b2368803565ed62ba147aa38adfe57089fe44125f5e07eea3d21b')		
package() {
	install -Dm644 "amar.desktop" "${pkgdir}/usr/share/applications/amar.desktop"
        install -Dm644 "amar.py" "${pkgdir}/usr/bin/amar.py"
        install -Dm644 "amar.png" "${pkgdir}/usr/share/icons/amar.png"
        install -Dm644 "amar.conf" "${pkgdir}/etc/pacman.d/amar.conf"
} 

