# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=v3.13.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse.ci/introduction.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64")
sha512sums=('82371100d5c8975d251efdccb4e2dc3688f4d0bc6ef79abe2be26297b49f5888705d0e09e45cb9a6cb495cf2fbcdd69b0995f64b5c075171d33f13705be99f7a')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
