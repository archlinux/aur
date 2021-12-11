# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <bohoomil@zoho.com>

_ctan=erewhon
pkgname=otf-$_ctan
pkgver=1.116
pkgrel=1
pkgdesc='A font family based on Heuristica, which is based in turn on Utopia'
arch=(any)
url="http://www.ctan.org/tex-archive/fonts/$_ctan"
license=(OFL)
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/fonts/$_ctan.zip")
sha256sums=('6520872b2fa1af11a05b80298826894201b84b3034c755ede2006f42bd453458')

package_otf-erewhon() {
	cd "$_ctan"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" opentype/*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" doc/{FontLog.txt,"$_ctan"-doc.pdf}
}
