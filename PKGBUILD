# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-cli
pkgver=2.9.5
pkgrel=1
pkgdesc='A simple CLI for scaffolding Vue.js projects'
arch=(any)
url='https://github.com/vuejs/vue-cli'
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/vue-cli/-/vue-cli-$pkgver.tgz)
noextract=(vue-cli-$pkgver.tgz)
sha512sums=(c6b3c6139a536d94bb5f559a05e4430cb4196f542ff7608feca622f57befa9c86201be4599e4500a4a3fc933860768612ca142bd293916a7863f5240ecc711e4)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/vue-cli-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
