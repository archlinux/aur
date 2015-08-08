pkgname=soundfont-zeldamcsf2
pkgver=20050118
pkgrel=1
pkgdesc="Legend of Zelda: Minish Cap soundfont for MIDI playback"
arch=(any)
url="http://tssf.gamemusic.ca"
license=("Public Domain")
source=("zeldamcsf2.zip::http://www.zophar.net/download_file/13208")
md5sums=('77df61cb2675dbfc59d2c8cdba3229b0')

package() {
 install -Dm644 "$srcdir/mcsf2.sf2" "$pkgdir/usr/share/soundfonts/mcsf2.sf2"
}
