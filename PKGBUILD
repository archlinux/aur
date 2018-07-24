# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=svgo
pkgver=1.0.5
pkgrel=1
pkgdesc='Node.js tool for optimizing SVG files'
arch=(any)
url=https://github.com/svg/svgo
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-svgo)
options=(!emptydirs !strip)
source=($url/archive/v$pkgver.tar.gz)
noextract=(v$pkgver.tar.gz)
sha512sums=(9ee8f7903922a5e623fc15c219b7d18755808941823a147b1e7bbdd59803c7c2be101aa147dc32719edec88443be82fb892fd26101494db5f663d94d05fb586f)

package() {
  npm install -g --prefix $pkgdir/usr v$pkgver.tar.gz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
