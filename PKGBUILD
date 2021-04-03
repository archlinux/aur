# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=20210330
pkgrel=1
_commit=bb80aa8c34c948975145e5f04c204c3508cf169b
pkgdesc="Upgrades Roboto to become a more powerful Variable Font"
arch=('any')
url="https://github.com/TypeNetwork/Roboto-Flex"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/RobotoFlex[slnt,wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('c348c638a1c0370501735afa9cee6f1ac269c964fbbd7e3cf7f21f7a9574854d'
            'b023c5d35f13b14327b1db316eb8660f9924edb1819906b97e2c7dfef1b683f0')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
