# Maintainer: Martin Pugh <martin at parity dot io>

pkgname=polkadot-bin
pkgver=0.7.33
pkgrel=1
pkgdesc="Binary builds of the Polkadot Node Implementation"
arch=('x86_64')
provides=("polkadot")
url="https://github.com/paritytech/polkadot"
license=('GNU')
depends=()
_urlbase='https://github.com/paritytech/polkadot/releases/download/'
source=(
  "$_urlbase/v$pkgver/polkadot"
  "$_urlbase/v$pkgver/polkadot.asc"
)
sha256sums=(
  "bfb4c0124e26776b850b7f71eebb86500187f08b49b4da63ed411291bb7da03e"
  "26cc33c7832c4320527a66c3d5b85acc9a40a7d4321f124c20e8a81d2a1612f9"
)

package(){
  install -D -m755 polkadot "$pkgdir/usr/bin/polkadot"
}
