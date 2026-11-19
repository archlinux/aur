
pkgname=mindwtr-beta-bin
pkgver=1.3.9
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
_release_tag=v1.3.9
_asset_version=1.3.9
source_x86_64=("${url}/releases/download/${_release_tag}/mindwtr_${_asset_version}_amd64.deb")
sha256sums_x86_64=('bd0dea355e526855ec6c419dd557fe77fc7244132c16346fa8ab3bcd4e094f7b')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}
