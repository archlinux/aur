# Maintainer: Keiran <me@keiran.cc>
pkgname=slopr
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI client to the slop.sh api"
arch=('x86_64')
url="https://github.com/keirim/slopr"
license=('MIT')
depends=('glibc')
provides=('slopr')
conflicts=('slopr')

source=("$pkgname-$pkgver.tar.gz::GITHUB_RELEASE_URL")
sha256sums=('SKIP')

package() {
    install -Dm755 "slop" "$pkgdir/usr/bin/slop"
}
