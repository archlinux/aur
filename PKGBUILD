# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.29.4'
pkgrel=1
pkgdesc='Log viewer which translates JSON logs into pretty human-readable representation'
url='https://github.com/pamburus/hl'
conflicts=('hl-log-viewer')
depends=()
makedepends=()
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/pamburus/hl/releases/download/${pkgver//_/-}/hl-linux-x86_64-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/pamburus/hl/releases/download/${pkgver//_/-}/hl-linux-arm64-gnu.tar.gz")
sha512sums_x86_64=('51b9f7bed92d6bee6a5a4615f57a15311410d057b100d023f10502a9a5480f4dffc61b1f717b06a7b22a3897570949569f789f6731be4c91927ee88042de38de')
sha512sums_aarch64=('824151546ae800507a065af753c9c625ecd602cde3b6ca99380a02fc9acf75bc4152a152f870b33464949e19fc7883fe8c025404db9542daa3f64cb6d8ddf92c')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
