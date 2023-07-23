pkgname=starplot-bin
pkgver=0.95.5
pkgrel=1
_pkgrel="8.3+b1"
pkgdesc="starplot-bin"
arch=('x86_64')
url="http://starplot.org/"
license=('GPL2')
provides=('starplot')
source_x86_64=("https://mirror.ip-projects.de/debian/pool/main/s/starplot/starplot_${pkgver}-${_pkgrel}_amd64.deb")
sha256sums_x86_64=('b547e8e698d3a4efbdd26fa3c34ae2eb415c13597726c7edc0f2991d079b0276')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir"/usr/share/doc
	rm -rf "$pkgdir"/usr/share/doc-base
}
