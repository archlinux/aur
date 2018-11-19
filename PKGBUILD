# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=versionist
pkgdesc='Flexible CHANGELOG generation toolkit that adapts to your commit conventions'
pkgver=3.0.2
pkgrel=1
arch=('any')
url='https://github.com/balena-io/versionist'
license=('APACHE')
depends=('nodejs>=4.0.0')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('d1f3a4293f7f75a26ec70ae4e7a69ee1f02b9990c379ca4e4038180a2c78a233')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
