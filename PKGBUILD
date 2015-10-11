# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: lorenzo at frenzart dot com
pkgname=ttf-luculent
pkgver=2.0.0
pkgrel=1
pkgdesc="Luculent is a family of scalable (vector), monospaced, geometric sans-serif screen fonts designed for programmers"
arch=('any')
url="http://eastfarthing.com/luculent/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
install='ttf-luculent.install'
source=(http://eastfarthing.com/luculent/luculent.tar.xz)
md5sums=('d24dbe89d6255115153b699b8e06501b')

package() {
	cd "$srcdir/luculent"
	for f in luculentbi.ttf luculentb.ttf luculenti.ttf luculent.ttf; do
		install -Dm644 "$f" "${pkgdir}/usr/share/fonts/TTF/${f}"
	done
}

