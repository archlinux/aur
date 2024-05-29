# Maintainer: LevitatingBusinessMan <me@levitati.ng>
pkgname=rrd2html
pkgver=0.0.1
pkgrel=4
pkgdesc='A tool for generating html pages from rrd data'
arch=(any)
url='https://github.com/LevitatingBusinessMan/rrd2html.rb'
license=('MIT')
depends=('ruby' 'rrdtool' 'ruby-tomlrb')
backup=('etc/rrd2html.toml')
_commit='1dbc0143ad1e8275638983468e36949245f5a5b5'
source=("$pkgname-$pkgrel::git+https://github.com/LevitatingBusinessMan/rrd2html.rb.git#commit=$_commit")
sha256sums=('SKIP')

package() {
	cd "$pkgname-$pkgrel"
	install -Dm755 rrd2html.rb "$pkgdir/usr/bin/rrd2html.rb"
	install -Dm755 README.adoc "$pkgdir/usr/share/rrd2html/README.adoc"
	install -Dm644 rrd2html.slim "$pkgdir/usr/share/rrd2html/rrd2html.slim"
	install -Dm644 rrd2html.toml "$pkgdir/etc/rrd2html.toml"
}
