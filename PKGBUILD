# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin-beta
pkgver=1.2.6
epoch=1
pkgrel=1
pkgdesc="Mindwtr beta binary release (legacy name; migrate manually to mindwtr-beta-bin)"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
optdepends=('evolution-data-server: GNOME system calendar integration')
provides=('mindwtr' 'mindwtr-bin' 'mindwtr-beta-bin')
conflicts=('mindwtr' 'mindwtr-bin' 'mindwtr-beta-bin')
_release_tag=v1.2.6
_asset_version=1.2.6
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('fa8aaac40a070152cc554bd6769e1ba3ec21e465b2344a2589a534dcefc0422a')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
