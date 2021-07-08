# Maintainer: Eric Lay <ericlaytm@gmail.com>
pkgname=fuzzy-pkg-finder
pkgver=0.9.4
pkgrel=1
pkgdesc="Simple cli command for using fzf to search and install packages"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/ericlay/$pkgname"
license=('GPL3')
depends=('pacman'
    'yay'
    'fzf'
    'wget')
makedepends=('git')
source=("git+https://gitlab.com/airclay/fuzzy-pkg-finder.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 fpf -t "$pkgdir/usr/bin"
}
