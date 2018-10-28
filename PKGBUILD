# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>

pkgname=nodejs-wildduck
pkgver=1.10.1
pkgrel=1
pkgdesc='Opinionated email server'
arch=(i686 x86_64)
url=https://wildduck.email
license=(EUPL)
depends=('nodejs>=8.0.0' mongodb redis)
makedepends=(npm)
conflicts=(wildduck)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr wildduck@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
