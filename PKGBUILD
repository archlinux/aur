# Maintainer: Your Name <you@example.com>
pkgname=fastflowlm-gtk
pkgver=2.0.0
pkgrel=1
pkgdesc="A minimalist desktop interface for FastFlowLM"
arch=('x86_64')
url="https://github.com/marleylinux/FastFlowLM-GTK"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libsoup3' 'gtksourceview5' 'fastflowlm')
source=("$pkgname::git+https://github.com/marleylinux/FastFlowLM-GTK.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 flm-gtk "$pkgdir/usr/bin/flm-gtk"
    install -Dm644 flm-gtk.png "$pkgdir/usr/share/pixmaps/flm-gtk.png"
    install -Dm644 flm-gtk.desktop "$pkgdir/usr/share/applications/flm-gtk.desktop"
}
