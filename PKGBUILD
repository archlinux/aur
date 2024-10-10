# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=5.8.3
pkgrel=1
pkgdesc=' The zsh manager for auto-expanding abbreviations, inspired by fish shell. '
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/zsh-abbr/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('455730e4b646b46409678ffc540c09a08c4a7ae277434edb197c376a1ee6002ffc9a369e6ffb0e78b93fd8efb8536abc5645442c9509a33303bb5e6f7386644b')

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dvm644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
