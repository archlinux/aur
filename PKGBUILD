# Author: esclapion <esclapion[at]gmail[dot]com>
# Maintainer: esclapion <esclapion[at]gmail[dot]com>

pkgname=mhwd-chroot
pkgver=1.4
pkgrel=1
pkgdesc="chroot gui"
url="https://forum.manjaro.org/index.php?topic=21472.0"
arch=('any')
license=('GPL')
depends=('')
optdepends=('gksu: gnome gui for su'
            'kdesu: kde gui for su')
source=("http://esclapion.free.fr/AUR/${pkgname}-$pkgver.tar.gz")
md5sums=('af28f5adaebd9cdce00ce35547528084')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-shell" "${pkgdir}/usr/bin/${pkgname}-shell"
  install -Dm644 "${pkgname}-gksu.desktop" "${pkgdir}/usr/share/applications/${pkgname}-gksu.desktop"
  install -Dm644 "${pkgname}-kdesu.desktop" "${pkgdir}/usr/share/applications/${pkgname}-kdesu.desktop"
}
