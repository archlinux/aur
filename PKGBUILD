# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>

pkgname=nodejs-zone-mta
pkgver=1.13.3
pkgrel=1
pkgdesc='Modern outbound MTA cross platform and extendable server application'
arch=(i686 x86_64)
url=https://github.com/zone-eu/zone-mta
license=(EUPL)
depends=(nodejs)
makedepends=(npm)
conflicts=(zone-mta)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr zone-mta@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
