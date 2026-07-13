# Maintainer: jlucaso <jlucaso at users dot noreply dot github dot com>
pkgname=jean-bin
pkgver=0.1.66
pkgrel=1
pkgdesc="AI assistant application built with Tauri, React, and TypeScript"
arch=('x86_64')
url="https://github.com/coollabsio/jean"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
provides=('jean')
conflicts=('jean')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/Jean_${pkgver}_amd64.deb")
sha256sums_x86_64=('ff5666a5e42f1c9b32d1dff48adeb247bf1268d4b3f4f0b17ba8efe6aa70e1b3')

package() {
    tar -xzf data.tar.gz -C "${pkgdir}"
}
