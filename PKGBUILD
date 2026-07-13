# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin-beta
pkgver=1.1.0
epoch=1
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water (beta binary release)"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
provides=('mindwtr' 'mindwtr-bin')
conflicts=('mindwtr' 'mindwtr-bin')
_release_tag=v1.1.0
_asset_version=1.1.0
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('ef5e52b2785c2a2da2ee44ad47744bacd66fa6c96dcfc7c9274ef14946de928f')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
