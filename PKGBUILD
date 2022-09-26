# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=termv-git
_pkgname=termv
pkgver=v1.2
pkgrel=2
pkgdesc="A terminal iptv player written in bash"
arch=('any')
url="https://github.com/Roshan-R/termv"
license=('GPL')
depends=('bash' 'fzf' 'jq' 'mpv' 'wget')
makedepends=('git')
conflicts=('termv')

source=("${_pkgname}-${pkgver}::https://github.com/Roshan-R/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5ab655818f4ed20435885102b6dd8789e07726e8d25f41d35bf29a8091a3e2c6')

package () {

    _pkgver=$(echo $pkgver | sed 's/v//g')
	cd "${_pkgname}-${_pkgver}"

    install -Dm775 termv "${pkgdir}/usr/bin/termv"

    }
