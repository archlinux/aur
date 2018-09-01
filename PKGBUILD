# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <bohoomil@zoho.com>

_ffname=erewhon
pkgname=otf-"$_ffname"
pkgver=1.08
pkgrel=1
depends=('fontconfig')
pkgdesc="Erewhon is based on the Heuristica family, which is based in turn on Utopia. The size is 6% smaller than Heuristica, matching that of UtopiaStd."
url="http://www.ctan.org/tex-archive/fonts/$_ffname"
arch=('any')
license=('custom:OFL')
conflicts=("$pkgname-ibx")
source=("http://mirrors.ctan.org/fonts/erewhon.zip")
sha256sums=('d1821e2d1fcf16192fd2e32b29b09ae72bed810ea67b33c92d8f285cb4d75748')

package(){
    cd "$_ffname"
    install -Dm0644 doc/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 opentype/*.otf -t "$pkgdir/usr/share/fonts/OTF/"
}
