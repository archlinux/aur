# Maintainer: Cork

pkgname=soundfont-opl3
pkgver=1.1
pkgrel=1
pkgdesc="A SoundFont designed to simulate the classic MIDI sound of the Sound Blaster 16 (and other YM262 enabled hardware)."
arch=('any')
url="https://gitlab.com/psi29a/opl3-soundfont"
license=('CC')
source=('OPL-3_FM_128M.sf2::http://www.emu-france.com/?wpfb_dl=4232'
		  'LICENSE::https://gitlab.com/psi29a/opl3-soundfont/-/raw/master/LICENSE')
sha256sums=('39bff96eee3dcfbce9665e3968701b894ca2136c7d0bd580281b2bbf59e80392'
            '2003829cf643d61b00a76088dd31bb11b8029546f24c56b39fd492adb9281483')

package() {
   install -Dm644 "OPL-3_FM_128M.sf2" "$pkgdir/usr/share/soundfonts/OPL-3_FM_128M.sf2.sf2"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/soundfont-opl3/LICENSE"
}

