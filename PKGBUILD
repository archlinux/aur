# Maintainer: Vidhu Kant Sharma <vidhukant@vidhukant.com>

pkgname=macli
_pkgname=macli
_pkgver=1.20.5
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
sha256sums_x86_64=('6826ada7643098de98bf369b5b3a143c28debab0fe0386296891c3e3ec7268c2')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/macli-${pkgver}-linux_amd64/macli"
}
