# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=5.4.1
pkgrel=1
pkgdesc=' The zsh manager for auto-expanding abbreviations, inspired by fish shell. '
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/olets/zsh-abbr/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0c50bff8a850695005d112068b7a5b43ad7756ad54d26476f1efffdd88ec5eaa28c68d95d6437b2e12049b8c145292d9347fedd2cb2ebc0c07f062e6fa8815b0')

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dvm644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
