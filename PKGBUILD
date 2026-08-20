# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex
pkgver=5.0.1
pkgrel=1
pkgdesc='Package manager for agents, skills, and hooks across AI coding tools'
arch=('x86_64')
url='https://kendex.ai'
license=('MIT')
provides=('kendex')
conflicts=('kendex-git')
options=('!strip')
source=("kendex-$pkgver::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex-x86_64-unknown-linux-gnu")
sha256sums=('a3dee4c286614016198db72603fcf95de277ddf1a245da052dc815821f0e84c0')

package() {
  install -Dm755 "$srcdir/kendex-$pkgver" "$pkgdir/usr/bin/kendex"
}
