# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <bohoomil@zoho.com>

_fname=erewhon
pkgname=otf-"$_fname"
pkgver=1.102
pkgrel=2
pkgdesc="a font family based on Heuristica, which is based in turn on Utopia"
url="http://www.ctan.org/tex-archive/fonts/$_fname"
arch=('any')
license=('OFL')
conflicts=("$pkgname-ibx")
source=("http://mirrors.ctan.org/fonts/$_fname.zip")
sha256sums=('c5785f1729593185b3eed46d8ff8a8c4f3b2145df76926d2d1e324fa15a7e66a')

package() {
    cd "$_fname"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" opentype/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/OFL.txt
}
