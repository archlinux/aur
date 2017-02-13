# Maintainer: Olga Smirnova <mistresssilvara@hotmail.com>
pkgbase='hunspell-ie'
pkgname=('hunspell-ie' 'hyphen-ie')
pkgver=0.6
pkgrel=1
pkgdesc="Interlingue hunspell dictionary"
arch=('any')
url="http://github.com/Carmina16/hunspell-ie"
license=('Apache')
optdepends=('hunspell: the spell checking libraries and apps')
source=('https://github.com/Carmina16/hunspell-ie/archive/v0.6.tar.gz')
md5sums=('94929cf2bdbed5ad5aaac932550d34ad')

package_hunspell-ie() {
	cd "$srcdir/${pkgbase}-${pkgver}"
	install -d -m 755 "$pkgdir/usr/share/hunspell"
	install -m 644 ie.{aff,dic} "$pkgdir/usr/share/hunspell"
}

package_hyphen-ie() {
	optdepends=('hyphen: library for hyphenation and justification')
	pkgdesc="Interlingue hyphenation rules"

	cd "$srcdir/${pkgbase}-${pkgver}"
	install -d -m 755 "$pkgdir/usr/share/hunspell"
	install -m 644 hyph_ie.dic "$pkgdir/usr/share/hunspell"
}

