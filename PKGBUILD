# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=fvim-bin
pkgver=0.3.498_g0190abd
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
source=("https://github.com/yatli/fvim/releases/download/v0.3.498%2Bg0190abd/fvim-linux-x86_64-v0.3.498+g0190abd.rpm")
md5sums=('SKIP')
arch=('x86_64')
options=('staticlibs')

package() {
	cd $srcdir
        rpmextract.sh fvim-linux-x86_64-v0.3.489+g98c4036.rpm
	cp -r "$srcdir/usr" "$pkgdir"
}
