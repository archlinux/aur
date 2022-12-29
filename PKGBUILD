# Maintainer: darkelectron <darkelectron(dot)aur(at)tutanota(dot)com
pkgname=termv
_pkgname=termv
pkgver=v1.3
pkgrel=1
pkgdesc="A terminal iptv player written in bash"
arch=('any')
url="https://github.com/Roshan-R/termv"
license=('GPL')
depends=('bash' 'fzf' 'jq' 'mpv' 'curl' 'gawk')
optdepends=('xdo: for terminal swallowing')
makedepends=('git')
conflicts=('termv-git')

source=("${_pkgname}-${pkgver}::https://github.com/Roshan-R/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ebda5a315a738080c879595ac883c12c6314a3c5ea98f970ef7e3bad6bcc429f')

package () {
  _pkgver=$(echo $pkgver | sed 's/v//g')
	cd "${_pkgname}-${_pkgver}"
  install -Dm775 termv "${pkgdir}/usr/bin/termv"
}
