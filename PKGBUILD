pkgname=hyprclock-bin
pkgver=0.1.0a
pkgrel=1
pkgdesc="Binary release of Hyprclock, a clock utility made for the Hyprland window manager."
arch=('x86_64')
url="https://github.com/cvusmo/hyprclock"
license=('GPL-3.0-only')

depends=('gtk4' 'gstreamer' 'gst-plugins-base')

source=("https://github.com/cvusmo/hyprclock/releases/download/v${pkgver}/hyprclock-${pkgver}.tar.gz")

sha256sums=('3456f9dee5b7d67b8ba75a33cd87e540857049a66d58200f350c8e5c3e700e73')

package() {
    install -Dm755 "$srcdir/hyprclock" \
        "$pkgdir/usr/bin/hyprclock"
}
