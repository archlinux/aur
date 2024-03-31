#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="${_pkgname}-bin"
pkgver=3.4.1
pkgrel=1
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('5cf1d28e6d2d6168b10f2e7fac5425fe6789491834c047b5f7bb21ab84b9eaf5')
source_aarch64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('6fe80045b97b97a09863a96aa1bb17599af2af166434aaba8f027253789b7c99')

package() {
	install -Dm755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
