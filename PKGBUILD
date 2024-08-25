# Maintainer: modula t. <defaultxr at pm dot me>

pkgname=maim-vst3
pkgver=1.0.0
pkgrel=1
pkgdesc='Audio plugin for custom MP3 distortion and digital glitches.'
arch=('x86_64')
url='https://github.com/ArdenButterfield/Maim'
license=('GPL3')
depends=()
groups=('pro-audio' 'vst3-plugins')
makedepends=('unzip')
source=("https://github.com/ArdenButterfield/Maim/releases/download/v$pkgver/Maim-$pkgver-Linux.zip")
md5sums=('f6bd24dd5f51b7ca7f4742cee9ed1441')

package() {
    install -Dm755 "$srcdir/VST3/Maim.vst3/Contents/x86_64-linux/Maim.so" "$pkgdir/usr/lib/vst3/Maim.vst3/Contents/x86_64-linux/Maim.so"
}
