# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin-beta
pkgver=1.2.0rc4
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
_release_tag=v1.2.0-rc.4
_asset_version=1.2.0-rc.4
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('e23d551f135ddf7ce1b119fb69695d971847230f00e528f0c33fa34457563bed')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
