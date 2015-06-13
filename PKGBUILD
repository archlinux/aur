# Maintainer: SanskritFritz (gmail)
# Contributor: Chris_tian (AUR)

pkgname=dead-cyborg-episode1
pkgver=002
pkgrel=6
pkgdesc='Free, donation based oldskool sci-fi adventure game with 3D first person view'
arch=('i686' 'x86_64')
url='http://deadcyborg.com/'
license=('freeware' 'donationware')
depends=('openal' 'sdl' 'ffmpeg' 'libpng' 'libtiff' 'libjpeg6' 'zlib' 'python')
optdepends=('alsa-oss: for ALSA support through OSS.')
install='dead-cyborg-episode1.install'
source=("http://deadcyborg.com/deadcyborg-episode1-linux_v${pkgver}.tar.bz2"
        "dead-cyborg-episode1.png" "dead-cyborg-episode1.desktop" "dead-cyborg-episode1.sh"
        "start-game_oss_fullscreen.sh" "start-game_oss.sh")
options=(!strip)

package() {
	cd $srcdir
	install -d "$pkgdir/opt/dead-cyborg-episode1"
	cp --archive DeadCyborg-Episode1-Linux_v${pkgver}/* "$pkgdir/opt/dead-cyborg-episode1"
	install -D dead-cyborg-episode1.png "$pkgdir/usr/share/pixmaps/dead-cyborg-episode1.png"
	install -D dead-cyborg-episode1.sh "$pkgdir/usr/bin/dead-cyborg-episode1"
	install -D dead-cyborg-episode1.desktop "$pkgdir/usr/share/applications/dead-cyborg-episode1.desktop"
	install -D start-game_oss_fullscreen.sh "$pkgdir/opt/dead-cyborg-episode1/start-game_oss_fullscreen.sh"
	install -D start-game_oss.sh "$pkgdir/opt/dead-cyborg-episode1/start-game_oss.sh"
}

md5sums=('29d5b8c3b16d449f9b63d605a6619785'
         '7e09a96ce0c4837308ac3eb2d660f64e'
         '64503e992b5ac5aa2ec38b276d748d6e'
         'bd15b4713bd18876a0717b5627a28cfd'
         '852547068515d132baee2cc9ca8fabfa'
         '89b7e8b0a15575e817471f1842a3806e')
