#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="${_pkgname}-bin"
pkgver=4.0.0
pkgrel=1
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('63c4bfee5053ba58d79aeb70e02144d70f519d3b740ba05ec026df58c3eb4847')
source_aarch64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('146a87b9dc0e3dd60f3e3a3a4b5599d47afa190442116fe20d576d5c604a97e5')

package() {
	install -Dm755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
