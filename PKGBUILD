# Maintainer: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=3.9.0
pkgrel=1
pkgdesc='Swagger UI is a collection of HTML, Javascript, and CSS assets that dynamically generate beautiful documentation from a Swagger-compliant API.'
arch=('i686' 'x86_64')
url='https://swagger.io/swagger-ui/'
license=('Apache')
source=("https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('695f97ca424dd0d3563bf9a8ee4664c02bcca92c')
sha256sums=('721465fb74b80c0e0729e6091ca16c28e59bb2687c80f992c4f9db916865f82d')
sha512sums=('f1f9929258adf9e9d1500cdb8eaf03ded3134ab2d3d822f84f1731f45158ab043420a5b871417e8059618ced58ab80250e869d12bdbed3c2984897a249af0fd0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
