# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=aurdupes
pkgver=1.0
pkgrel=1
pkgdesc='Uses your local pacman repos and an AUR package list to find duplicate packages.'
arch=('any')
url='http://cryptocrack.de/projects/#aurdupes'
license=('BSD')
depends=('python' 'pyalpm')
source=("http://cryptocrack.de/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('433007d736c7829aed4d5d1462e090dd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm0755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
