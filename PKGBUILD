# Maintainer: j605
pkgname=fig2ps
pkgver=1.5
pkgrel=1
pkgdesc='Perl script designed to convert Xfig files to postscript or PDF files, processing text using LaTeX'
arch=('any')
url='http://fig2ps.sourceforge.net'
license=('GPL')
depends=('texlive-core' 'ghostscript' 'fig2dev')
provides=('fig2ps')
conflicts=('fig2eps')
source=('https://downloads.sourceforge.net/project/fig2ps/fig2ps-1.5.tar.bz2')
md5sums=('22ea30b5d0f36dfec7b462449b0fc82b')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
