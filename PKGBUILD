# Maintainer: TakahashiRinta <1586182829@qq.com>
# Contributor: TakahashiRinta <1586182829@qq.com>

pkgname=fastruct
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast directory structure viewer with colored output, depth warning, and save to file support"
arch=('x86_64')
url="https://github.com/GuitaristRin/fastruct"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('fastruct')

source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/GuitaristRin/fastruct/releases/download/v$pkgver/$pkgname-$pkgver-linux-x86_64.tar.gz")

sha256sums=('d0746747460abcc7d1f74ddb1dd0cc88e154580249ae506c3e014f73bb465247')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 fastruct "$pkgdir/usr/local/bin/fastruct"
}
