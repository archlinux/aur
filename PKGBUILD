# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=weex-toolkit
pkgver=1.3.8
pkgrel=1
pkgdesc='Apache Weex CLI toolkit'
arch=(i686 x86_64)
url=https://github.com/weexteam/weex-toolkit
license=(GPL3)
depends=(nodejs)
makedepends=(npm)
conflicts=(weex)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('f8aa27a626c17e105a00cc1567d225df07e337aff37bfe716d7033a2ef4b324ba75f75304658ddc5f5689a864f7029e27d0fd8afb8305f13f60f6eef34bedf7e')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
