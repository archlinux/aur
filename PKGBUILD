# Maintainer: Nick Boughton (nicholboughton@gmail.com)

pkgname=vue-cli
pkgver=3.1.3
pkgrel=2
pkgdesc='Standard tooling for Vue.js development'
arch=(i686 x86_64)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr @vue/cli@$pkgver
  chmod -R 755 "$pkgdir"/usr 
}
