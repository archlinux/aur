# Maintainer: Torsten Henschel <to at h6l dot de>
# Contributor: Karol Babioch <karol at babioch dot de>

pkgname=getssl
pkgver=2.45
pkgrel=1
pkgdesc='Obtain SSL certificates from the letsencrypt.org ACME server. Suitable for automating the process on remote servers.'
arch=('any')
url='https://github.com/srvrco/getssl'
license=('GPL3')
depends=('openssl' 'curl' 'bind-tools')
makedepends=('git')
source=("$pkgname::git+https://github.com/srvrco/getssl.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
