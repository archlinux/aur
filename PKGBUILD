# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Faye Jackson <justalittleepsilon@gmail.com>
pkgname=coc
pkgver=1.0.2
pkgrel=1
_tagver="v$pkgver"
pkgdesc="An NSFW (18+) erotica game made by Fenoxo, Corruption of Champions"
url=https://www.fenoxo.com/play-games/
arch=(x86_64)
license=('All Rights Reserved')
depends=(flashplayer-standalone)
makedepends=()
provides=(coc)

source=("coc.swf::https://www.fenoxo.com/play/CoC_1.0.2.swf" "coc")
md5sums=('SKIP' '168c1806165b3169ffbc40ccfadd61de')

package() {
	cd $srcdir

	install -Dm 644 coc.swf "${pkgdir}/usr/share/coc/coc.swf"
	install -Dm 755 coc "${pkgdir}/usr/bin/coc"
}
