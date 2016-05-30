# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=ds
pkgver=0.1
pkgrel=1
pkgdesc="A simple script that \"does something\""
arch=('any')
license=('custom:WTFPL')
url="https://github.com/moviuro/ds"
depends=('bash' 'xdialog')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c8d32d12d06c0f154874e7d32bc88fbb4343126f999a66922244a33429ff274b')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm 0444 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm 0755 ds      ${pkgdir}/usr/bin/${pkgname}
  install -Dm 0444 ds.rc   ${pkgdir}/etc/ds.rc.sample
}
