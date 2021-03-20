# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=vr-lighthouse-bin
_pkgname=lighthouse
pkgver=0.2.0
pkgrel=1
pkgdesc="About
VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/lighthouse)
sha256sums=('8749a85f640425bddf3eb355ca8b8afab8b6490d32306cfdc648a72c2a11b24e')

package() {
  install -Dm755 lighthouse "$pkgdir/usr/bin/$_pkgname"
}
