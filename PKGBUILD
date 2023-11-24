# Maintainer: Vidhu Kant Sharma <vidhukant@vidhukant.com>

pkgname=macli
_pkgname=macli
_pkgver=1.21.0
pkgver="v$_pkgver"
pkgrel=1
pkgdesc='Unofficial CLI-Based MyAnimeList Client'
arch=("x86_64")
url='https://macli.vidhukant.com'
license=(GPL)
depends=("gnome-keyring")
options=('!strip' '!emptydirs')
source_x86_64=("macli-${pkgver}-linux_amd64.tar.gz::${url}/releases/${_pkgver}/macli-${pkgver}-linux_amd64.tar.gz")
provides=("macli")
conflicts=("macli" "macli-git")
sha256sums_x86_64=('b65f6613f7a85208cfa6b7e4d14f52525008f0f36890541111943247acdc28b5')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/macli-${pkgver}-linux_amd64/macli"
}
