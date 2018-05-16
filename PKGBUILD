# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=weex-toolkit
pkgver=1.2.9
pkgrel=3
pkgdesc='Apache Weex CLI toolkit'
arch=(any)
url='https://github.com/weexteam/weex-toolkit'
license=(GPL3)
depends=(nodejs)
makedepends=(npm)
conflict=(weex)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=(490fd9c77fdf7058f2634ad2974c2c52ff09a42991f66393f69c84d7cc7385907ce443d6c4591f4d74be7d1b53444c2364353e9da9a745788b03768c8a9ce87e)

package() {
  npm install -g --prefix $pkgdir/usr $srcdir/$pkgname@$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
}
