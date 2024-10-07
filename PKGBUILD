# Maintainer: A. Jack Roehr <hs@roe.hr>

pkgname=stan-hs-bin
pkgver=0.1.0.1
pkgrel=1
_ghcver=9.6.3
pkgdesc="Haskell STatic ANalyser"
arch=('x86_64')
url="https://kowainik.github.io/projects/stan"
license=('MPL-2.0')
provides=('stan-hs')
conflicts=()
depends=() # Static binary
options=("!strip" "!debug")
source=("https://github.com/kowainik/stan/releases/download/v$pkgver/stan-$pkgver-Linux-ghc-$_ghcver")
b2sums=("bd4d04da15b05816131999ee7bdcdd410f4dd4741da45097c3e04073e904901e2f7faa567edca3ee1e1d95fc6455fce327d27bf94c98e441f947ecada9d23c82")

package() {
	install -Dm755 "stan-$pkgver-Linux-ghc-$_ghcver" "$pkgdir/usr/bin/stan"
}
