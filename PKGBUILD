# Maintainer: Kobus van Schoor <pbscube at gmail dot com>
pkgname=dotgit-git
pkgver=31.05.2016
pkgrel=1
pkgdesc="Development version of dotgit"
url="http://github.com/Cube777/dotgit"
arch=('any')
depends=('git' 'sed' 'grep' 'bash' )
source=('git+https://github.com/Cube777/dotgit.git')
md5sums=('SKIP')

package() {
	install -Dm755 "$srcdir/$pkgname/dotgit" "$pkgdir/usr/bin/dotgit"
	install -Dm644 "$srcdir/$pkgname/bash_completion" "$pkgdir/usr/share/bash-completion/completions/dotgit"
}
