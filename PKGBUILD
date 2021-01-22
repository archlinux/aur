# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.1.2
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("$pkgname-$pkgver.tar.gz::https://github.com/steven-omaha/pacdef/archive/v$pkgver.tar.gz")
arch=('any')
license=('GPL3')
depends=('python')
sha512sums=('663aa517f78ecb72779a2f16b23a0014b13c1e7fe6a611b472810a8d427bf2b25fac94f4b2113073cd9f2139136e042e345ed1b37c806e3a6603172556428714')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 pacdef "${pkgdir}/usr/bin/pacdef"
}
