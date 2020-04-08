# Maintainer: Krystian Chachuła <krystiancha@gmail.com>
pkgname=soundfont-fatboy
pkgver=0.789
pkgrel=1
pkgdesc="A free GM/GS SoundFont for classic video game MIDI, emulation, and general usage."
arch=('any')
url="https://fatboy.site/"
license=('unknown')
source=("https://dl.fatboy.site/FatBoy-latest.7z")
sha256sums=(99c0ed3a19d1626c79ccea79c11ba60f92ce6251376d8251b5c26c5bafeff504)

package() {
    install -Dm644 "FatBoy-v$pkgver.sf2" "$pkgdir/usr/share/soundfonts/FatBoy.sf2"
}
