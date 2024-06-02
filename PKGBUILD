# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=midori-bin
pkgver=11.3.3
pkgrel=1
pkgdesc="Browser fork of Floorp fork of Firefox by Astian"
arch=(x86_64)
url="https://astian.org/midori-browser/"
license=(MPL-2.0)
depends=(gtk3 alsa-lib nspr dbus-glib nss

         # namcap implicit depends
         libxcb dbus gcc-libs glib2 cairo fontconfig libxrandr libxfixes libxcursor freetype2 libxi gdk-pixbuf2 glibc
         libxcomposite libxext pango libxrender libx11 libxdamage at-spi2-core libxtst hicolor-icon-theme)
provides=(midori)
conflicts=(midori)
source_x86_64=("https://github.com/goastian/midori-desktop/releases/download/v${pkgver}/midori_${pkgver}_amd64.deb")
sha256sums_x86_64=('f3662f41252012fae901b0681f5832d63ad6a3e52c6cfb9b8524ce3cd0d3413d')
options=(!strip)

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
