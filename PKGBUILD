# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny-wrapper
pkgver=1.1.2
pkgrel=2
pkgdesc="A wrapper around acme-tiny for easier certificate generation"
url="https://github.com/tasn/acme-tiny-wrapper"
makedepends=('git')
depends=('bash' 'acme-tiny')
license=('MIT')
arch=('any')
source=("git+git://github.com/tasn/acme-tiny-wrapper.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
    cd "$pkgname"

    install -m 0755 -d $pkgdir/usr/bin/
    install -m 0755 acme-tiny-wrapper $pkgdir/usr/bin/acme-tiny-wrapper
}


