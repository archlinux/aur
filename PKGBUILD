# Maintainer: Nick Boughton (nicholasboughton@gmail.com)

pkgname=vue-cli-service-global
_pkgname=@vue/cli-service-global
pkgver=4.3.1
pkgrel=1
pkgdesc='vue-cli-service global addon for vue-cli'
arch=(i686 x86_64)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs vue-cli)
makedepends=(npm)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr $_pkgname@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
