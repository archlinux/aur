# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=zux-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="mDNS-SD Visualizer - A cross platform mDNS browsing visualizer written in Rust using tauri and svelte"
arch=('x86_64')
url="https://github.com/hrzlgnm/zux"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('zux')
source_x86_64=("https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_linux_x64")
sha256sums_x86_64=('efe4d8b212c423329ead96580f36444cdd40d04ee04647b1b4a743436a669549' '8aebafd1f53b95c4ce2b103ddb05b4e77f4a199bc07c9ca1671ef4db689955d7')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    install -Dm755 zux_linux_x64 "${pkgdir}/usr/bin/zux"
}
