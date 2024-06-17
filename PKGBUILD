# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.29.7'
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
sha512sums_x86_64=('e258c5d814d20a0d4b8518753803831f0c71e31d64a2d365e1f3c0727dac95cb158c30738f90b13aa5ed5b98b6975cf75ba785c286298a4990842547489ac979')
sha512sums_aarch64=('9034e0ba26cc105ea3cff20e575f8c001873c97bccecad636d5edc3de0bd47d87f1afbc73ee0e1abde28c6f5318da331347446e5a48ca11cf8419f8180cf0cfd')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
