# Maintainer: puddings233 <puddings233 at outlook dot com>

pkgname=otf-fandol-auto
pkgver=1
pkgrel=1
pkgdesc="fandol fonts from package texlive-langchinese"
license=("GPL3")
depends=(texlive-langchinese)
makedepends=()
arch=("any")
url="https://www.ctan.org/pkg/fandol"

package() {
	cd "$srcdir"
	install -d "$pkgdir"/usr/share/fonts/OTF
	cp /usr/share/texmf-dist/fonts/opentype/public/fandol/*.otf "$pkgdir/usr/share/fonts/OTF"
}

