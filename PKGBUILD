# Maintainer: Martin C. Doege <mdoege at compuserve dot com>
# Maintainer: éclairevoyant

pkgname=soundfont-fatboy
pkgver=0.790
pkgrel=2
pkgdesc="A free GM/GS SoundFont for classic video game MIDI, emulation, and general usage"
arch=('any')
_archive_prefix="https://web.archive.org/web/20220124174052"
url="$_archive_prefix/https://fatboy.site/"
license=('unknown')
source=("$pkgname-$pkgver.7z::$_archive_prefix/https://dl.fatboy.site/FatBoy-latest.7z")
sha256sums=('330aad903459a8363f822ee5ac1c24beb01321196baca2bbee0c5fbfda0c6870')

package() {
    install -Dm644 "FatBoy-v$pkgver.sf2" "$pkgdir/usr/share/soundfonts/FatBoy.sf2"
}

