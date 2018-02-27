# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=soundfont-opl3-fm-128m
pkgver=1.0
pkgrel=1
pkgdesc="A SoundFont designed to simulate the classic MIDI sound of the Sound Blaster 16 (and other YM262 enabled hardware)."
arch=('any')
url="http://zandro.freeunixhost.com/opl3/"
license=('CC-BY-SA 4.0')
source=("https://musical-artifacts.com/artifacts/15/OPL-3_FM_128M.zip"
  "LICENSE"
)
md5sums=('a3eebf25a47f683f129620ed8341347f'
         'e277f2eefa979e093628e4fb368f5044')

package() {
  install -Dm0644 "$srcdir/OPL-3_FM_128M.sf2" "$pkgdir/usr/share/soundfonts/OPL-3_FM_128M.sf2"
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
