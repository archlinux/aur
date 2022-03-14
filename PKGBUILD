# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=fvim-bin
pkgver=0.3.512_g2c1625b
_pkgver=$(echo "${pkgver}" | sed -e "s/_/-/g")
pkgrel=1
pkgdesc="Cross platform Neovim front-end UI, built with F# + Avalonia"
arch=('x86_64')
url="https://github.com/yatli/fvim"
license=('MIT')
groups=()
depends=('neovim' 'ttf-dejavu')
makedepends=('rpmextract')
optdepends=()
provides=('fvim')
conflicts=('fvim')
source=("https://github.com/yatli/fvim/releases/download/v0.3.512%2Bg2c1625b/fvim-linux-x86_64-v0.3.503+g5254e85-9-g2c1625b.rpm")
md5sums=('SKIP')
arch=('x86_64')
options=('staticlibs')

package() {
	cd $srcdir
        rpmextract.sh fvim-linux-x86_64-v0.3.503+g5254e85-9-g2c1625b.rpm
	cp -r "$srcdir/usr" "$pkgdir"
}
