# Maintainer Seva Alekseyev <sevaa@yarxi.ru>
# Maintainer: Pavle Portic (pavle.portic@tilda.center)

pkgname=vue-cli-plugin-pwa
pkgver=3.11.0
pkgrel=1
pkgdesc='PWA plugin for the vue CLI'
arch=(i686 x86_64)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs vue-cli)
makedepends=(npm)
conflicts=()
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr @vue/cli-plugin-pwa@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}

