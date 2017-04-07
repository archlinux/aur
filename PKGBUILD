# Maintainer: Elrondo46 <elrond94@hotmail.com>

pkgname=steam-primusrun-manjaro
pkgver=1.0
pkgrel=1
pkgdesc="Primusrun launcher for optimus system in Manjaro by TuxnVape Team"
arch=('any')
license=('GPL3')
url="https://www.tuxnvape.fr"
#conflicts=('')
depends=('steam-manjaro')

source=("primusrunsteam"
        "primusrunsteam.desktop")

sha256sums=('SKIP'
			'SKIP')

package() {
        install -Dm755 "primusrunsteam" "${pkgdir}/usr/bin/primusrunsteam"
        install -Dm755 "primusrunsteam.desktop" "${pkgdir}/usr/share/applications/primusrunsteam.desktop"
        } 

