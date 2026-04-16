# Maintainer: sohlk <sohlk at outlook dot com>

pkgname=eleventy-upgrade-help
pkgver=3.0.2
pkgrel=1
pkgdesc="A plugin to help you upgrade your Eleventy project"
arch=('any')
url='https://github.com/11ty/eleventy-upgrade-help'
license=('MIT')
depends=('nodejs' 'eleventy')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/11ty/eleventy-upgrade-help/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  npm install -g --production --legacy-peer-deps --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  chown -R root:root "${pkgdir}"
}
