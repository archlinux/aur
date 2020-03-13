# Maintainer: Olga Smirnova <mistresssilvara@hotmail.com>
pkgbase='hunspell-ie'
pkgname=('hunspell-ie' 'hyphen-ie')
pkgver=1.0
pkgrel=1
pkgdesc="Interlingue hunspell dictionary"
arch=('any')
url="http://github.com/Carmina16/hunspell-ie"
license=('Apache')
optdepends=('hunspell: the spell checking libraries and apps')
changelog=ChangeLog
source=("https://github.com/Carmina16/hunspell-ie/archive/v${pkgver}.tar.gz")
md5sums=('d54cd51fd96a74350997fc0bc77ec123')
sha256sums=('f1d7271c6e1da24d084fbbcb4871f25e7ab7614c33606eb1a51b07de4948aa22')

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

