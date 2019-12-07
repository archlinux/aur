# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=aurdupes
pkgver=1.0
pkgrel=1
pkgdesc='Uses your local pacman repos and an AUR package list to find duplicate packages.'
arch=('any')
url='https://lfos.de/#osp'
license=('BSD')
depends=('python' 'pyalpm')
source=("https://git.lfos.de/$pkgname.git/snapshot/$pkgname-$pkgver.zip")
md5sums=('186be9ac91cf1b8efcc16bcdd472c7ae')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm0755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
