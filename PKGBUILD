
# Contributor: releasehub <releasehub@proto.me>
pkgname=sqlchat
_pkgname=sqlchat
pkgver=1.0.0
pkgrel=1
pkgdesc="Chat-based SQL Client and Editor for the next decade"
arch=("x86_64")
url="https://github.com/sqlchat/sqlchat"
license=('MIT')
provides=("releasehub")
conflicts=()
depends=('webkit2gtk' 'xdotool' 'libayatana-appindicator'
    glibc libx11 gtk3 dbus hicolor-icon-theme openssl pango glib2 gcc-libs
    libxtst
    cairo
    gdk-pixbuf2
)
source=(
    "https://github.com/CorrectRoadH/Pake/releases/download/V7.0.0/SQLChat_x86_64.deb"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir/"
    tar -xvf data.tar.gz
    install -d ${pkgdir}/usr/
    cp -r $srcdir/usr/* ${pkgdir}/usr/
}
