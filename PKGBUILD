# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-cli
pkgver=2.9.6
pkgrel=1
pkgdesc='A simple CLI for scaffolding Vue.js projects'
arch=(any)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/vue-cli/-/vue-cli-$pkgver.tgz)
noextract=(vue-cli-$pkgver.tgz)
sha512sums=(b304346dfc894967c5af8d885ebf00efbe320359fe62e761cec68704a8564a47334aa8ef819bd2bccf0d127c7a40a9df3870576dd351e6f85a8633543257ed41)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/vue-cli-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
