# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor-bin
pkgver=30.1.6
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
sha256sums=('9c1d4e3efbf15166f7da5f67a98daff91b9784386dc126951a96cfb389b7c0bb')

options=(!debug)

package() {
  install -Dm755 "./auto-editor-${pkgver}-bin" "${pkgdir}/usr/bin/auto-editor"
}

# vim: ft=sh ts=2 sw=2 et
