# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.30.1'
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
sha512sums_x86_64=('cda9952231495b466bbb083896a61f317309a1516cdd293b8f4f53a39290590157d7266bd3cb50f4efdf8c8afb6ef60eb4ea571d08868f3e07da3e1d5c2c5dd7')
sha512sums_aarch64=('c935330a5388727cb3aa94cd4184ea2e205f135993dec6ed25626e594bb7cb1045f36a93170c93a2c11f43ca4c7846350b6d5335ddf3dc41ba2734ef143ffc45')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
