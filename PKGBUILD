# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=pcmanfm-gtk3-root
pkgver=1.2.5
pkgrel=1
pkgdesc="PCManFM GTK3 with admin rights with polkit"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=('pcmanfm-gtk3')

source=("pcmanfmroot.desktop"
        "org.tnv.pcmanfmpolk.policy")

sha256sums=('d2ea3cb2a69230c9f50622fb3e2d9de3692a127118da570b01513ed08b21dfa7'
            '51d70cbd7a4078ec91397f6f227a692af37015af7cf6c91d606b5449640588fd')		

package() {
        install -Dm644 "pcmanfmroot.desktop" "${pkgdir}/usr/share/applications/pcmanfmroot.desktop"
        install -Dm644 "org.tnv.pcmanfmpolk.policy" "${pkgdir}/usr/share/polkit-1/actions/org.tnv.pcmanfmpolk.policy"
} 

