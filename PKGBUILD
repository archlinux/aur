# Maintainer: TakahashiRinta <1586182829@qq.com>
# Contributor: TakahashiRinta <1586182829@qq.coma>

pkgname=fastruct
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast directory structure viewer with colored output and depth control"
arch=('x86_64')
url="https://github.com/GuitaristRin/fastruct"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('fastruct')

source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/GuitaristRin/fastruct/releases/download/v$pkgver/$pkgname-$pkgver-linux-x86_64.tar.gz")

sha256sums=('05942065fd5d5570c486d372df5cd7153178913887b1b9bb8736a4fbc2479db2')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 fastruct "$pkgdir/usr/local/bin/fastruct"
}
