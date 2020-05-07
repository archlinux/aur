# Maintainer: Martin Pugh <martin at parity dot io>

pkgname=polkadot-bin
pkgver=0.7.32
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
  "c34d63e5d80994b2123a3a0b7c5a81ce8dc0f257ee72064bf06654c2b93e31c9"
  "8f415b6975812b7675479b86f08e2c2935f64096e72daf6234ebc34be4df04f7"
)

package(){
  install -D -m755 polkadot "$pkgdir/usr/bin/polkadot"
}
