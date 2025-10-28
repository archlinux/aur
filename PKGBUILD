# Maintainer: TransparentLC <me@akarin.dev>

pkgname=cloudemoticon-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="A cloud solution to your favorite emoticons."
arch=('x86_64')
url="https://github.com/TransparentLC/cloudemoticon-rs"
license=('AGPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3')
options=('!strip' '!emptydirs')
source_x86_64=("${pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=("ecf2e08897fd78980092b1e291b35e4f87fe5063e0887214da8658bf234f1605")

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
}
