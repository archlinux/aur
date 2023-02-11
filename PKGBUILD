# Maintainer: Raryel C. Souza <raryel.csouza at protonmail dot com>

pkgname=zoom-citrix-plugin
pkgver=5.13.1
_subver=22610
pkgrel=1
pkgdesc="Zoom VDI Citrix plugin https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
arch=('x86_64')
license=('custom')
url="https://cdn.zoom.us/prod/vdi/"
depends=('icaclient')
optdepends=()
replaces=('zoomcitrixplugin')

source=("${url}${pkgver}.${_subver}/zoomcitrixplugin-centos_${pkgver}.rpm")

sha512sums=('218e0974618a12080c880234cec57f94e9b4b3d1abacb328209c6d099a5d673f5701523fc43ee69f7a3052579e1ffc24f0f4bd2f151ea0185189ca1eae0e71bf')

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
