# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>

pkgbase=gtksourceview-lolcode
pkgname=('gtksourceview2-lolcode' 'gtksourceview3-lolcode' 'gtksourceview4-lolcode')
pkgver=0.1
pkgrel=2
arch=('any')
url="https://lolcode.org/"
license=('MIT')
makedepends=('git')
optdepends=( 'lci: lolcode commandline interpreter')
source=("${pkgbase}::git+https://github.com/Lucki/gtksourceview3-lolcode.git#commit=f80e35e")
sha512sums=('SKIP')

package_gtksourceview2-lolcode()
{
	pkgdesc="lolcode syntax highlight support in gtksourceview2"
	depends=('gtksourceview2')

	install -Dm644 "${srcdir}/${pkgbase}/lolcode.lang" "${pkgdir}/usr/share/gtksourceview-2.0/language-specs/lolcode.lang"
	install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_gtksourceview3-lolcode()
{
	pkgdesc="lolcode syntax highlight support in gtksourceview3"
	depends=('gtksourceview3')

	install -Dm644 "${srcdir}/${pkgbase}/lolcode.lang" "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/lolcode.lang"
	install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}

package_gtksourceview4-lolcode()
{
	pkgdesc="lolcode syntax highlight support in gtksourceview4"
	depends=('gtksourceview4')

	install -Dm644 "${srcdir}/${pkgbase}/lolcode.lang" "${pkgdir}/usr/share/gtksourceview-4/language-specs/lolcode.lang"
	install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[2]}/LICENSE"
}
