# Maintainer: jlucaso <jlucaso at users dot noreply dot github dot com>
pkgname=jean-bin
pkgver=0.1.67
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
sha256sums_x86_64=('bd2b9acc0b6ac1b1c1aed1fef467860de0d1fb78d3540dd5a950df2414e9932c')

package() {
    tar -xzf data.tar.gz -C "${pkgdir}"
}
