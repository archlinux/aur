# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=20210407
pkgrel=1
_commit=03275a272efaefe5939cbe4db05777dead5e3697
pkgdesc="Upgrades Roboto to become a more powerful Variable Font"
arch=('any')
url="https://github.com/TypeNetwork/Roboto-Flex"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/RobotoFlex[slnt,wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('3abd3f56e8b4f609c807ea0c55c53e6a130a2c1830b59e3a48399b10a06d84a8'
            'b023c5d35f13b14327b1db316eb8660f9924edb1819906b97e2c7dfef1b683f0')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
