# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-beta-bin
pkgver=1.2.7
epoch=1
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water (beta binary release)"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
optdepends=('evolution-data-server: GNOME system calendar integration')
provides=('mindwtr' 'mindwtr-bin' 'mindwtr-bin-beta')
conflicts=('mindwtr' 'mindwtr-bin' 'mindwtr-bin-beta')
replaces=('mindwtr-bin-beta')
_release_tag=v1.2.7
_asset_version=1.2.7
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('697589c29500a75dd3153696b2ec1887fa93ea3a9761c30af0bdf5b4d2b3a577')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
