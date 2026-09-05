# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin-beta
pkgver=1.2.8
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
_release_tag=v1.2.8
_asset_version=1.2.8
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('9746381457badd3dd471c0b3a655b0c3a11d4440ab8d2e38cd16d513591036af')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
