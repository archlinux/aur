# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=amar-installer
pkgver=1.7
pkgrel=3
pkgdesc="Install AMAR repository"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=('tk' 'python-pillow')
install=amar.install
source=("amar.py"
        "amar.png"
        "amar.desktop"
        "amar.conf"
	"org.tnv.amar.policy")

sha256sums=('f092667c42b6da2b5a4d8defb031c7d4be1f8560b1b7cfdd9af757ce9eb737b1'
            '874700067f446dff59f8e4e6c3b14519ca8afdf31742af629343c80002c71376'
            'c5dbfca766050bdbfd36866c1f479ca8039aae80fa8b2847b376c05087d1364c'
            'd8fafeb25a8b2368803565ed62ba147aa38adfe57089fe44125f5e07eea3d21b'
            'dcf05a9d8c5cfe2cc23523eaab9bbd30932b3d2c68ad8d38edbdcad372053920')		

package() {
        install -Dm644 "amar.desktop" "${pkgdir}/usr/share/applications/amar.desktop"
        install -Dm644 "amar.py" "${pkgdir}/usr/bin/amar.py"
        install -Dm644 "amar.png" "${pkgdir}/usr/share/icons/amar.png"
        install -Dm644 "amar.conf" "${pkgdir}/etc/pacman.d/amar.conf"
        install -Dm644 "org.tnv.amar.policy" "${pkgdir}/usr/share/polkit-1/actions/org.tnv.amar.policy"
} 

