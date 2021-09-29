# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=fig2eps
pkgver=1.7
pkgrel=2
pkgdesc="A tool to convert Xfig figures to EPS with embedded LaTeX commands"
arch=(any)
url="http://www.courville.org/home/fig2eps"
license=('unknown')
depends=('psutils' 'texlive-bin')
source=("fig2eps::http://www.courville.org/fig2eps?attredirects=0")
md5sums=('638b9b0e93cca5766626c30674ad78cd')
sha1sums=('c937fa7414b6a1f921cf70edaac132bc99015244')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
