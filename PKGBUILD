# Maintainer: Raryel C. Souza <raryel.csouza at protonmail dot com>
pkgname=zoom-citrix-plugin
pkgver=5.14.11
_subver=23790
pkgrel=1
pkgdesc="Zoom VDI Citrix plugin "
arch=('x86_64')
license=('custom')
url="https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
depends=('icaclient')
optdepends=()
replaces=('zoomcitrixplugin')

source=("https://cdn.zoom.us/prod/vdi/${pkgver}.${_subver}/zoomcitrixplugin-centos_${pkgver}.rpm")

sha512sums=('eed2f3ef802ca613b26adcc916022d05a4a6daf9fbad865caf9a7e34172ab26348093b21953e634b8009af6d58923c8968c636547e7c6b8b189c986296264b88')

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}

