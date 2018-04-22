# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=caja-root
pkgver=1.20
pkgrel=2
pkgdesc="Caja with admin rights with polkit"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=('caja')

source=("cajaroot.desktop"
        "org.mate.cajasu.policy")

sha256sums=('3d04e693e73c511cc69e70b84636dbbcb6d3d4bb0db729e5038ea5e02a123a7e'
            '67ee7ce49a6df086e73d428edabe801698efd79e15192ceb08d705d49a108b1f')		

package() {
        install -Dm644 "cajaroot.desktop" "${pkgdir}/usr/share/applications/cajaroot.desktop"
        install -Dm644 "org.mate.cajasu.policy" "${pkgdir}/usr/share/polkit-1/actions/org.mate.cajasu.policy"
} 

