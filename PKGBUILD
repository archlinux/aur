pkgname=object0-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="FOSS desktop S3 bucket manager built with Tauri"
arch=('x86_64')
url="https://github.com/sayedhfatimi/object0"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'glib2' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=(!strip)

source_x86_64=("object0-${pkgver}.deb::https://github.com/sayedhfatimi/object0/releases/download/v${pkgver}/object0_${pkgver}_linux_x64_installer.deb")
sha256sums_x86_64=('4a41cdb93241367ad712b951f2c87c810c493266ba94388f2a77edc599e54426')

package() {
  cd "${srcdir}"
  ar x "object0-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}
