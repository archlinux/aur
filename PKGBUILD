# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=20210510
pkgrel=1
_commit=c1a1ca89126780915a0904ae185116626b9236d4
pkgdesc="Upgrades Roboto to become a more powerful Variable Font"
arch=('any')
url="https://github.com/TypeNetwork/Roboto-Flex"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/RobotoFlex[slnt,wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('5ba7107aed74c66cba9646d87e432eb6a904412173993a7795f76f928bbe9495'
            'b023c5d35f13b14327b1db316eb8660f9924edb1819906b97e2c7dfef1b683f0')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
