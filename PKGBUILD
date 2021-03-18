# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=vr-lighthouse-bin
_pkgname=lighthouse
pkgver=0.1.0
pkgrel=1
pkgdesc="About
VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/lighthouse)
sha256sums=('4b55fd2382622b2412d54ace6d1c228f0fdb1fd0e5873767f97dc1fbe397f1c2')

package() {
  install -Dm755 lighthouse "$pkgdir/usr/bin/$_pkgname"
}
