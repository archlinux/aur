# Maintainer: Sadie <zulc22db plus oss at gmail dot com>

pkgname=ttf-sadiec64ex-git
pkgver=latest
pkgrel=1
pkgdesc="Unicode Truetype font based on the Commodore 64's PETSCII character set."
arch=('any')
url='https://github.com/zulc22/bmpfont-c64ex'
license=('0BSD')
depends=('xorg-fonts-encodings')
makedepends=('bitsnpicas')
source=('c64ex::git+https://github.com/zulc22/bmpfont-c64ex.git')
sha256sums=('SKIP')

package() {
  ttf_dir="${pkgdir}/usr/share/fonts/TTF/"
  install -d "${ttf_dir}"
  bitsnpicas convertbitmap -f ttf -o "${ttf_dir}/c64ex.ttf" ./c64ex/sadiesc64x.kbitx
  chmod 644 "${ttf_dir}c64ex.ttf"
}
