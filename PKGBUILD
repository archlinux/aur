# Maintainer: taotieren <admin@taotieren.com>

pkgname=hghub-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Plug-in media player"
arch=(x86_64)
url="https://github.com/Minireel/HGhub"
license=('PolyForm-Noncommercial-1.0.0')
provides=()
conflicts=()
# replaces=(${pkgname})
depends=(
    cairo
    dbus
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libgcc_s.so
    libsoup3
    # openssl
    webkit2gtk-4.1
)
makedepends=()
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${url}/releases/download/v${pkgver}/HGhub_${pkgver}_amd64.deb")
sha256sums=('873949d247a498f25afa0458dc66252f5cf4764610a6ddd17b394051b07416cf')

package() {
    bsdtar -xf data* -C ${pkgdir}/
}
