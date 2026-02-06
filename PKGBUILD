# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor-bin
pkgver=29.7.0
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('x86_64')
license=("Unlicense")
provides=("auto-editor")
conflicts=("auto-editor")
depends=("glibc" "gcc-libs" "nvidia-utils" "cuda-12.9")
optdepends=(
  'yt-dlp: download and use URLs as inputs'
  'xdg-utils: automatically open completed files with xdg-open')
source=("auto-editor-$pkgver-bin::https://github.com/WyattBlue/auto-editor/releases/download/${pkgver}/auto-editor-linux-${CARCH}")
sha256sums=('6f8bbdf59bc3abdb84d8bbd71699f28dc6f8f0f07633a7c330390f8410710151')

options=(!debug)

package() {
  install -Dm755 "./auto-editor-${pkgver}-bin" "${pkgdir}/usr/bin/auto-editor"
}

# vim: ft=sh ts=2 sw=2 et
