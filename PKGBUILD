# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Faye Jackson <justalittleepsilon@gmail.com>
pkgname=tits
pkgver=0.8.090
pkgrel=1
_tagver="v$pkgver"
pkgdesc="An NSFW (18+) erotica game made by Fenoxo, Trials In Tainted Space"
url=https://www.fenoxo.com/play-games/
arch=(x86_64)
license=('All Rights Reserved')
depends=(flashplayer-standalone)
makedepends=()
provides=(tits)

source=("tits.swf::https://www.fenoxo.com/play/latest_download.php" "tits")
md5sums=('SKIP' 'b0fd9e9b3e257e5363259e639156442b')

package() {
	cd $srcdir

	install -Dm 644 tits.swf "${pkgdir}/usr/share/tits/tits.swf"
	install -Dm 755 tits "${pkgdir}/usr/bin/tits"
}
