# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: lorenzo at frenzart dot com
pkgname=ttf-luculent
pkgver=1.0.0
pkgrel=3
pkgdesc="Luculent is a family of scalable (vector), monospaced, geometric sans-serif screen fonts designed for programmers"
arch=('any')
url="http://eastfarthing.com/luculent/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
install='ttf-luculent.install'
source=(http://eastfarthing.com/luculent/luculent.tar.xz)
md5sums=('9bea5510215f11da6500bffe86d1aca3')

package() {
	cd "$srcdir/luculent"
	for f in luculentbi.ttf luculentb.ttf luculenti.ttf luculent.ttf; do
		install -Dm644 "$f" "${pkgdir}/usr/share/fonts/TTF/${f}"
	done
}
