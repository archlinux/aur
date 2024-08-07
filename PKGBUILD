# Maintainer: Olga Smirnova <mistresssilvara@hotmail.com>
pkgbase='hunspell-ie'
pkgname=('hunspell-ie' 'hyphen-ie')
pkgver=1.1
pkgrel=1
pkgdesc="Interlingue hunspell dictionary"
arch=('any')
url="http://github.com/Carmina16/hunspell-ie"
license=('Apache')
optdepends=('hunspell: the spell checking libraries and apps')
changelog=ChangeLog
source=("https://github.com/Carmina16/hunspell-ie/archive/v${pkgver}.tar.gz")
md5sums=('9deba99345dffed67d0b09c72840b058')
sha256sums=('a6ea4283341fc7902516a211a0dc7e762cfaf104d1be64a961a893dbdebe3507')

package_hunspell-ie() {
	cd "$srcdir/${pkgbase}-${pkgver}"
	install -d -m 755 "$pkgdir/usr/share/hunspell"
	install -m 644 ie.{aff,dic} "$pkgdir/usr/share/hunspell"
}

package_hyphen-ie() {
	optdepends=('hyphen: library for hyphenation and justification')
	pkgdesc="Interlingue hyphenation rules"

	cd "$srcdir/${pkgbase}-${pkgver}"
	install -d -m 755 "$pkgdir/usr/share/hyphen"
	install -m 644 hyph_ie.dic "$pkgdir/usr/share/hyphen"
}

