# $Id: PKGBUILD 188929 2016-09-07 12:50:30Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=mustache-d
pkgver=0.1.2
pkgrel=1
pkgdesc="Moustache template engine for D"
arch=(any)
url="https://github.com/repeatedly/mustache-d"
license=(custom:boost)
depends=()
makedepends=()
source=($pkgname-$pkgver::"https://github.com/repeatedly/mustache-d/archive/v$pkgver.tar.gz" "http://www.boost.org/LICENSE_1_0.txt")
sha256sums=('39f1eda9453837dc3ca3ee8cded19fa569d0b5f4a43d775a8a258bce53523164'
            'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566')

package() {
  cd $pkgname-$pkgver
  install -Dm644 src/mustache.d "$pkgdir"/usr/include/d/mustache-d/mustache.d
  install -Dm644 "$srcdir"/LICENSE_1_0.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
