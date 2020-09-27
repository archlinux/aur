# Maintainer: Chiller Dragon <chillerdragon@gmail.com>
pkgname=ttf-know-your-product
pkgver=1.0
pkgrel=1
pkgdesc="The font Know Your Product by Vic Fieger used in the game teeworlds"
arch=(any)
url="https://www.dafont.com/know-your-product.font"
license=('CCPL:cc-by-sa-3.0')
source=("knowyour.ttf::https://www.dafont.com/know-your-product.font"
        "LICENSE::https://creativecommons.org/licenses/by-sa/3.0/")
sha256sums=('10ff07d6740a723b18c88ae6b5e4c09702226bddadffdafe20ca78ab375de8b3'
            'e550f7bd34d25b04bb0a3fac7f3981d51b41df363d21f35952ee27da259039a2')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 knowyour.ttf "${pkgdir}/usr/share/fonts/TTF/knowyour.ttf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

