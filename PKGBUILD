# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor-bin
pkgver=31.4.2
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
sha256sums=('bd6b249de12d2c1a18457010491088ca830a927acecdf86a0e84636287a8c762')

options=(!debug)

package() {
  install -Dm755 "./auto-editor-${pkgver}-bin" "${pkgdir}/usr/bin/auto-editor"
}

# vim: ft=sh ts=2 sw=2 et
