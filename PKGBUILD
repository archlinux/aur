# Maintainer: Kobus van Schoor <pbscube at gmail dot com>
pkgname=dotgit-git
pkgver=26.06.2017
pkgrel=4
pkgdesc="Development version of dotgit"
url="http://github.com/Cube777/dotgit"
arch=('any')
depends=('git' 'bash' 'gnupg')
conflicts=('dotgit')
source=('git+https://github.com/Cube777/dotgit.git')
md5sums=('SKIP')

package()
{
	install -Dm 755 "$srcdir/dotgit/bin/dotgit" "$pkgdir/usr/bin/dotgit"
	cp -r "$srcdir/dotgit/bin/dotgit_headers" "$pkgdir/usr/bin/dotgit_headers"
	install -Dm644 "$srcdir/dotgit/bin/bash_completion" \
		"$pkgdir/usr/share/bash-completion/completions/dotgit"
}
