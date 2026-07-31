# Maintainer: MegalithOfficial <gekocakaya@gmail.com>
pkgname=basalt-launcher-dev-bin
pkgver=1.0.0.dev.4.1
pkgrel=2
pkgdesc="A polished Minecraft launcher with practical instance and content management (development build)"
arch=('x86_64')
url="https://github.com/MegalithOfficial/basalt-launcher"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('libarchive')
provides=('basalt-launcher')
conflicts=('basalt-launcher' 'basalt-launcher-bin')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/MegalithOfficial/basalt-launcher/releases/download/v1.0.0-dev.4.1/Basalt.Launcher_1.0.0_amd64.deb")
sha256sums_x86_64=('e6e072ab9c8c4146535457beb3ce1ca5df18e2e746f64919687e86f4696357ea')

package() {
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}
