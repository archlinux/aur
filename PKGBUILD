# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=ffmpeg-nvidia-headers
pkgver=8.1.24.1
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs'
arch=('x86_64')
url='http://ffmpeg.org/'
license=('GPL3')
source=("https://github.com/FFmpeg/nv-codec-headers/releases/download/n${pkgver}/nv-codec-headers-${pkgver}.tar.gz")
sha256sums=('05d493be523bd99949fa77b84a0d3b9b369809d27eaf7b371e4daa111c231d5a')

package() {
  cd nv-codec-headers-n${pkgver}

  make DESTDIR="${pkgdir}" PREFIX='/usr' install
}

# vim: ts=2 sw=2 et:
