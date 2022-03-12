# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowbyod-bin
pkgdesc="Build-your-own guitar distortion!"
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/BYOD/releases/download/v$pkgver/BYOD-Linux-x64-$pkgver.deb")
sha256sums=('f6346efe28ce291906cc13815e2e56e833945dcaaa2cb2700861de1c06abef95')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "BYOD-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

