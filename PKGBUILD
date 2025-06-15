# Maintainer: linfeng <2844126834@qq.com>
pkgname=sticky-rs-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Image sticky note app that enables users to stick pictures to the desktop and have them always visible"
arch=('x86_64')
url="https://github.com/FengZhongShaoNian/sticky-rs"
license=('GPL2')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
conflicts=('sticky-rs-git')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/sticky-rs_${pkgver}_amd64.deb")
sha256sums_x86_64=('21bcab070f1c1e6495ad48bfc887698a9b8257a110bb7342b64c5f1dba4db1c9')
package() {

  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
