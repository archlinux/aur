# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>

pkgname=nodejs-haraka
pkgver=2.8.21
pkgrel=2
pkgdesc='A fast, highly extensible, and event driven SMTP server'
arch=(i686 x86_64)
url=http://haraka.github.io/
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(haraka)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr Haraka@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
