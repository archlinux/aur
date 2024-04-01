# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=midori-bin
pkgver=11.2.2
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
options=(!strip)
source_x86_64=("https://astian.org/wp-content/uploads/midori-browser/linux/midori_${pkgver}_amd64.deb")
sha256sums_x86_64=('21b3437ec8e8023a51594a42985d7e470f0ff92b7f782383276e17755b50216d')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
