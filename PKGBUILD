# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=5.8.2
pkgrel=1
pkgdesc=' The zsh manager for auto-expanding abbreviations, inspired by fish shell. '
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/zsh-abbr/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fd112c2db373adcb00f3b18d4409cb3800fc17ce82bdc32a8cce8e62be3ca6c1852a24eab10cf56f838274120a49c904e1fe3e52e69580b450e633754b0ade43')

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dvm644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
