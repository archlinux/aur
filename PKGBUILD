# Maintainer: Eric Lay <ericlaytm@gmail.com>
# Contributor: Yochananmarqos
pkgname=fuzzy-pkg-finder
pkgver=1.2
pkgrel=1
pkgdesc="Simple cli command for using fzf to search and install packages"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/ericlay/$pkgname"
license=('GPL3')
depends=('pacman'
    'fzf'
    'expac'
    'curl'
    'gzip'
    'jq')
makedepends=('git')
optdepends=('yay: AUR helper'
			'paru: AUR helper')
source=("git+https://github.com/ericlay/fuzzy-pkg-finder.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 fpf -t "$pkgdir/usr/bin"
}
