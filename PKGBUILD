# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli
pkgdesc='Resin.io command line interface'
pkgver=4.0.2
pkgrel=1
arch=('any')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('8d325c1f2aed9901f13057ea47fcf9536ed6ec9880e3dd1e0b0fb8e99997eb72')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  rm -r "${pkgdir}/usr/etc"
}
