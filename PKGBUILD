# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=sddm-chinese-painting-theme
pkgver=0.1.2
pkgrel=1
pkgdesc="Chinese style SDDM theme"
arch=('any')
url="https://github.com/fralonra/sddm-chinese-painting-theme"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('5490b1aa9ccdb5364650b07bb875c748')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p ${pkgdir}/usr/share/sddm/themes

  cp -r chinese-painting/ ${pkgdir}/usr/share/sddm/themes/
}
