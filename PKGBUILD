# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=zux-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="mDNS-SD Visualizer - A cross platform mDNS browsing visualizer written in Rust using tauri and svelte"
arch=('x86_64')
url="https://github.com/hrzlgnm/zux"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('zux')
source_x86_64=("https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_linux_x64")
sha256sums_x86_64=('d6ab4af40a3d3759196a76fcbb8e4c761beebfa7f626df6ff27ed59959caf214' 'b488efe475ffc1b81ec2c4e46f4f98b090db443422eaa0ec9c83f37284efcecc')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    install -Dm755 zux_linux_x64 "${pkgdir}/usr/bin/zux"
}
