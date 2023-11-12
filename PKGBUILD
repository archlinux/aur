# Maintainer: darkelectron <darkelectron(at)mailfence(dot)com>
pkgname=termv
_pkgname=termv
pkgver=v1.4
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
sha256sums=('299b42999f40834543208d44d3e4174bf49cf3010b6d5b0c313848e00f3d24b4')

package () {
  _pkgver=$(echo $pkgver | sed 's/v//g')
	cd "${_pkgname}-${_pkgver}"
  install -Dm775 termv "${pkgdir}/usr/bin/termv"
}
