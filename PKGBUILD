#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="${_pkgname}-bin"
pkgver=3.5.0
pkgrel=1
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('a49eb9eb0913938b9cc5c4d2540e5f4440ca7d5842ba334da43300c30237ac27')
source_aarch64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('deca372b26e0b74b19d83b2b31422942f9e0364abb2eee25813d4b910c1e6231')

package() {
	install -Dm755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
