# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=v3.11.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse.ci/introduction.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64")
sha512sums=('a6ab660917bc8d98ba56e1538bd288835c52ce5fac0afdb08c1e35d05f1be379271af813366405883d02ea61566b5701f657e38d0a2d11fc3cee8467be7e351e')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
