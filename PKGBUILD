# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=20210705
pkgrel=1
_commit=4f6f399c088a0c75203291a6f030175ff538f65d
pkgdesc="Upgrades Roboto to become a more powerful Variable Font"
arch=('any')
url="https://github.com/TypeNetwork/Roboto-Flex"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/RobotoFlex[slnt,wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('4bc734e2b59247fc39e675c81be8badcd2ab01f9461a46fb10f08ba28e337dff'
            'b023c5d35f13b14327b1db316eb8660f9924edb1819906b97e2c7dfef1b683f0')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
