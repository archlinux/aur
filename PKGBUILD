pkgname=object0-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="FOSS desktop S3 bucket manager built with Tauri"
arch=('x86_64')
url="https://github.com/sayedhfatimi/object0"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'glib2' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=(!strip)

source_x86_64=("object0-${pkgver}.deb::https://github.com/sayedhfatimi/object0/releases/download/v${pkgver}/object0_${pkgver}_linux_x64_installer.deb")
sha256sums_x86_64=('78ff7205ec5ebeaa14aa83f0a6a54dbcd2a4b25a60fe6f38c89771851464f08b')

package() {
  cd "${srcdir}"
  ar x "object0-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}
