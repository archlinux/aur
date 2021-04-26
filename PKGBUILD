# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=termv-git
_pkgname=termv
pkgver=v1.0
pkgrel=1
pkgdesc="A terminal iptv player written in bash"
arch=('any')
url="https://github.com/Roshan-R/termv"
license=('GPL')
depends=('bash' 'fzf' 'jq' 'mpv' 'wget')
makedepends=('git')
conflicts=('termv')

source=("${_pkgname}-${pkgver}::https://github.com/Roshan-R/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('59c94456ffb382604e385df9824ae3b148127c831992a05a56a3567ac94713c4')

package () {

    _pkgver=$(echo $pkgver | sed 's/v//g')
	cd "${_pkgname}-${_pkgver}"

    install -Dm775 termv "${pkgdir}/usr/bin/termv"

    }
