# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=midori-bin
pkgver=11.3.2
pkgrel=1
pkgdesc="Browser fork of Floorp fork of Firefox by Astian"
arch=(x86_64)
url="https://astian.org/midori-browser/"
license=(MPL2)
depends=(gtk3 alsa-lib nspr dbus-glib nss

    # namcap implicit depends
    # libxcb dbus gcc-libs cairo fontconfig libxrandr libxfixes libxcursor freetype2 libxi gdk-pixbuf2 glibc
    # libxcomposite libxext pango libxrender libx11 libxdamage at-spi2-core libxtst hicolor-icon-theme
)
provides=(midori)
conflicts=(midori)
source_x86_64=("https://github.com/goastian/midori-desktop/releases/download/v${pkgver}/midori_${pkgver}_amd64.deb")
sha256sums_x86_64=('2a7ef1bf11d6ba2faa68c04d82cf012ed6f8e15a612f20ce473d3ce5a55a0695')
options=(!strip)

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
