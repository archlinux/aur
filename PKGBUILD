# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowmatrix-bin
pkgdesc="Matrix delay effect"
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('BSD')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/ChowMatrix/releases/download/v$pkgver/ChowMatrix-Linux-x64-$pkgver.deb")
sha256sums=('332749bba2fcfefeb68c105b9f55fd71aa7a8bfb524f592cbb68cc6c0581a767')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "ChowMatrix-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

