# Maintainer: linfeng <2844126834@qq.com>
pkgname=sticky-rs-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="Image sticky note app that enables users to stick pictures to the desktop and have them always visible"
arch=('x86_64')
url="https://github.com/FengZhongShaoNian/sticky-rs"
license=('GPL2')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
conflicts=('sticky-rs-git')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sticky-rs_${pkgver}_amd64.deb")
sha256sums_x86_64=('d5c728636af2281b02770eb06731bc02b2f1f6dd6e8a7debd479f775ea7ed357')
package() {

  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
