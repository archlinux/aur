pkgname=soundfont-zelda3sf2
pkgver=20040819
pkgrel=1
pkgdesc="Legend of Zelda: Link to the Past soundfont for MIDI playback"
arch=(any)
url="http://tssf.gamemusic.ca"
license=("Public Domain")
source=("zelda3sf2.zip::http://www.zophar.net/download_file/13207")
md5sums=('76a79226d699c9f0f63e27886219e20c')

package() {
 install -Dm644 "$srcdir/LttPSF2.sf2" "$pkgdir/usr/share/soundfonts/LttPSF2.sf2"
}
