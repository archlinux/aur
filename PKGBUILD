# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
pkgname=nouveau-reclocking
pkgdesc='A small utility to reclocking your GPU with Nouveau'
pkgver=1.0
pkgrel=1
arch=(any)
license=('GPL')
url='https://github.com/ventureoo/nouveau-reclocking'
depends=('lua')
provides=('nouveau-reclocking')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1b7cc1ec0794f4815000de9d24e724108e4fd4023fa68bedf747a709532c659')

package() {
  cd "$pkgname-$pkgver/src"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 nouveau-reclocking.lua "${pkgdir}/usr/bin/nouveau-reclocking"
}
