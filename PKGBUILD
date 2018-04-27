# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=v3.12.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse.ci/introduction.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64")
sha512sums=('6be545e839c7fe5597590ae68ac9aad2e1fa0d623bd8c91b0d8cb9db27552c70266765dce8b3ce9babea00ba2580f7675b8ac5d310bb41eefe6d377d728c5287')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
