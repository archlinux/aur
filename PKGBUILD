# Maintainer: Gerhard Schwanzer <geri@sdf.org>
pkgname=pw-duck
pkgver=0.1.0
pkgrel=1
pkgdesc="PipeWire audio ducking utility (prebuilt binary)"
arch=('x86_64')
url="https://github.com/geri1701/pw-duck"
license=('MIT')

depends=('pipewire')

provides=('pw-duck')
conflicts=('pw-duck')

source=("pw-duck-${pkgver}-x86_64::https://github.com/geri1701/pw-duck/releases/download/v${pkgver}/pw-duck-${pkgver}-x86_64")
sha256sums=('3b44283a0986efa3b73688ae325eac1d593d685f5e971ea30f7bc9797543899d')

package() {
  install -Dm755 "${srcdir}/pw-duck-${pkgver}-x86_64" "${pkgdir}/usr/bin/pw-duck"
}
