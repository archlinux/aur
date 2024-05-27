# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=5.8.0
pkgrel=1
pkgdesc=' The zsh manager for auto-expanding abbreviations, inspired by fish shell. '
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/zsh-abbr/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0b19125dcb17b7eede41847c58440f25671eadf15f3c222d4c2f135aa30a13f5cfaa5ca7c391f663f27db88aba1cede82efc9013a6f94aa1ceef57758c2603e4')

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dvm644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
