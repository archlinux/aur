# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.2.1
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("$pkgname-$pkgver.tar.gz::https://github.com/steven-omaha/pacdef/archive/v$pkgver.tar.gz")
arch=('any')
license=('GPL3')
depends=('python')
sha512sums=('46170f3b18106887de1dd2c560dc25d5487a3e161b70190e80f8e16137eb8861f27fcf29667bf815b8630956b756e0c436de8ee9f3503f81dc0b69aa003c3b46')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 pacdef "${pkgdir}/usr/bin/pacdef"
}
