# Maintainer: Karol Babioch <karol@babioch.de

pkgname=getssl
pkgver=1.0
pkgrel=1
pkgdesc='Obtain SSL certificates from the letsencrypt.org ACME server. Suitable for automating the process on remote servers.'
arch=('any')
url='https://github.com/srvrco/getssl'
license=('GPL2')
makedepends=('git')
source=("$pkgname::git+https://github.com/srvrco/getssl.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 getssl "$pkgdir/usr/bin/getssl"
}

