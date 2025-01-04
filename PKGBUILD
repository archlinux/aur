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
source=("https://github.com/keirim/slopr/releases/download/v$pkgver/slopr-$pkgver.tar.gz")

sha256sums=('SKIP')

package() {
    install -Dm755 "slopr" "$pkgdir/usr/bin/slopr"
}
