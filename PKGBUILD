# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=nouveau-reclocking
pkgdesc='A small utility to reclocking your GPU with Nouveau'
pkgver=1.1
pkgrel=1
arch=(any)
license=('GPL')
url='https://github.com/ventureoo/nouveau-reclocking'
depends=('lua')
provides=('nouveau-reclocking')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33940af8f51f22761acdf2425db064cb72a84a27ff72e20e521689851da44a0c')

package() {
  cd "$pkgname-$pkgver/src"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 nouveau-reclocking.lua "${pkgdir}/usr/bin/nouveau-reclocking"
}
