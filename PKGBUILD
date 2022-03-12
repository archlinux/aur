# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowphaser-bin
pkgdesc="Phaser effect based loosely on the Schulte Compact Phasing 'A'"
pkgver=1.1.1
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('BSD')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/jatinchowdhury18/ChowPhaser/releases/download/v$pkgver/ChowPhaser-Linux-x64-$pkgver.deb")
sha256sums=('554ef220e96ea2c355e8ed8aa0c94c8bbcc281b5ce8069a12865a75ef6737889')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "ChowPhaser-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

