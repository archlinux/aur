# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=amar-installer
pkgver=1.7.1
pkgrel=1
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

sha256sums=('3150e6b7721a6e63a2c7356e0b0babb5ab426b7aeaed09fdfb46b5ff51ea62cb'
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

