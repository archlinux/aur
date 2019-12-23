# Maintainer: Alexander Agura <agura@tfwno.gf>
pkgname=find-the-command
pkgver=1.4.2
pkgrel=1
pkgdesc="Advanced command-not-found hook for bash and zsh using the power of pacman"
arch=('any')
url="https://github.com/agura-lex/find-the-command"
license=('custom:WTFPL')
depends=('pacman>=5.0')
optdepends=('sudo: for root access (needed for packages installation)')
install=find-the-command.install
options=('docs')
source=("https://github.com/agura-lex/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3219bc4b574b2db1266154c75373670d')

package() {
	cd "$pkgname-$pkgver"
	rm .gitignore
	mkdir -p usr/share/licenses/$pkgname
	mv LICENSE usr/share/licenses/$pkgname/
	mv README.md usr/share/doc/$pkgname/
	cp -a * $pkgdir/
}
