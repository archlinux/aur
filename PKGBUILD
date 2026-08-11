# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin-beta
pkgver=1.2.0rc2
epoch=1
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water (beta binary release)"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
optdepends=('evolution-data-server: GNOME system calendar integration')
provides=('mindwtr' 'mindwtr-bin')
conflicts=('mindwtr' 'mindwtr-bin')
_release_tag=v1.2.0-rc.2
_asset_version=1.2.0-rc.2
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('825dd158680bd9ee4c80718f18538605577708524d2cb455b8975a3c580adfc9')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
