pkgname=now-playing-gtk
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal GTK now-playing widget using playerctl"
arch=('any')
license=('MIT')

depends=(
    'python'
    'python-gobject'
    'gtk3'
    'python-cairo'
    'playerctl'
    'glib2'
    'gdk-pixbuf2'
)
optdepends=(
    'nerd-fonts: for proper Unicode icons'
)

source=("now-playing-gtk.py" "nowplaying.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 now-playing-gtk.py \
        "$pkgdir/usr/bin/now-playing-gtk"

    install -Dm644 nowplaying.desktop \
        "$pkgdir/usr/share/applications/now-playing-gtk.desktop"
}
