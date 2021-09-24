pkgname=haraka
pkgver=2.8.27
pkgrel=1
pkgdesc='A fast, highly extensible, and event driven SMTP server'
arch=(i686 x86_64 aarch64)
url=http://haraka.github.io/
license=(MIT)
depends=(nodejs)
makedepends=(npm python2)
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr Haraka@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}


