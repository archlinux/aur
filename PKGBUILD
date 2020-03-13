# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <bohoomil@zoho.com>

_ctan=erewhon
pkgname=otf-$_ctan
pkgver=1.102
pkgrel=3
pkgdesc="A font family based on Heuristica, which is based in turn on Utopia"
arch=('any')
url="http://www.ctan.org/tex-archive/fonts/$_ctan"
license=('OFL')
conflicts=("$pkgname-ibx")
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/fonts/$_ctan.zip")
sha256sums=('c5785f1729593185b3eed46d8ff8a8c4f3b2145df76926d2d1e324fa15a7e66a')

package() {
    cd "$_ctan"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" opentype/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/OFL.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" doc/{FontLog.txt,"$_ctan"-doc.pdf}
}
