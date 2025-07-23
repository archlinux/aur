# Maintainer: TransparentLC <me@akarin.dev>

pkgname=cloudemoticon-rs
pkgver=0.1.6
pkgrel=3
pkgdesc="A cloud solution to your favorite emoticons."
arch=('x86_64')
url="https://github.com/TransparentLC/cloudemoticon-rs"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3')
options=('!strip' '!emptydirs')
source_x86_64=("${pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=("03dd507000b38d1e75b934fe6c107dd5f7cb95e2dc65f291e013cdfc4279b0c4")

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
}
