#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="${_pkgname}-bin"
pkgver=3.5.1
pkgrel=1
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('e2f36aa8149a0e883b5713398aa185c88a827fc0527d5cd2e2b05b88c9ba0b36')
source_aarch64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('74f83b7ff122422d2b6b9841e61a453305ca1bed5287987d026cb9645ab9a1d9')

package() {
	install -Dm755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
