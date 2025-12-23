# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor-bin
pkgver=29.5.0
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('x86_64')
license=("Unlicense")
provides=("auto-editor")
conflicts=("auto-editor")
depends=("glibc" "gcc-libs")
optdepends=(
  'yt-dlp: download and use URLs as inputs'
  'xdg-utils: automatically open completed files with xdg-open')
source=("auto-editor-$pkgver-bin::https://github.com/WyattBlue/auto-editor/releases/download/${pkgver}/auto-editor-linux-${CARCH}")
sha256sums=('51ac6b713440ae77c27d8619527cc88413cc45f40dc039e0190725b070fffa2b')

options=(!debug)

package() {
  install -Dm755 "./auto-editor-${pkgver}-bin" "${pkgdir}/usr/bin/auto-editor"
}

# vim: ft=sh ts=2 sw=2 et
