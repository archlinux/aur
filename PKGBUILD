# Maintainer: Krystian Chachuła <krystiancha@gmail.com>
pkgname=soundfont-fatboy
pkgver=0.789
pkgrel=1
pkgdesc="A free GM/GS SoundFont for classic video game MIDI, emulation, and general usage."
arch=('any')
url="https://fatboy.site/"
license=('unknown')
source=("https://dl.fatboy.site/FatBoy-latest.7z")
md5sums=("SKIP")

pkgver() {
	echo *sf2 | sed -e 's/FatBoy-v\(.*\).sf2/\1/'
}

package() {
	install -D "FatBoy-v$pkgver.sf2" "$pkgdir/usr/share/soundfonts/FatBoy.sf2"
}
