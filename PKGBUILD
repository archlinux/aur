# Maintainer: LevitatingBusinessMan <me@levitati.ng>
pkgname=rrd2html
pkgver=0.0.1
pkgrel=2
pkgdesc='A tool for generating html pages from rrd data'
arch=(any)
url='https://github.com/LevitatingBusinessMan/rrd2html.rb'
license=('MIT')
depends=('ruby' 'rrdtool' 'ruby-tomlrb')
backup=('etc/rrd2html.toml')
_commit='3be8e56cab7ec5ccbfcd6b31ab73e4255871ff2d'
source=("$pkgname-$pkgrel::git+https://github.com/LevitatingBusinessMan/rrd2html.rb.git#commit=$_commit")
sha256sums=('SKIP')

package() {
	cd "$pkgname-$pkgrel"
	install -Dm755 rrd2html.rb "$pkgdir/usr/bin/rrd2html.rb"
	install -Dm755 README.adoc "$pkgdir/usr/share/rrd2html/README.adoc"
	install -Dm644 rrd2html.slim "$pkgdir/usr/share/rrd2html/rrd2html.slim"
}
