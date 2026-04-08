# Maintainer: jlucaso <jlucaso at users dot noreply dot github dot com>
pkgname=jean-bin
pkgver=0.1.35
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
sha256sums_x86_64=('317e6f6cdba4638632d5c87131ed42792dae449b821e5c29b8ae2d29d84da060')

package() {
    tar -xzf data.tar.gz -C "${pkgdir}"
}
