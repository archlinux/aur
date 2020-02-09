# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <bohoomil@zoho.com>

_ffname=erewhon
pkgname=otf-"$_ffname"
pkgver=1.102
pkgrel=1
depends=('fontconfig')
pkgdesc="Erewhon is a font family based on Heuristica, which is based in turn on Utopia"
url="http://www.ctan.org/tex-archive/fonts/$_ffname"
arch=('any')
license=('custom:OFL')
conflicts=("$pkgname-ibx")
source=("http://mirrors.ctan.org/fonts/erewhon.zip")
sha256sums=('c5785f1729593185b3eed46d8ff8a8c4f3b2145df76926d2d1e324fa15a7e66a')

package(){
    cd "$_ffname"
    install -Dm0644 doc/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 opentype/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
}
