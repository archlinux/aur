#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="${_pkgname}-bin"
pkgver=3.3.0
pkgrel=1
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('60f17d9f0bc92e254a9a7901b480b1ce3ee240c49a17e86da943f835f0080719')
source_aarch64=("${_pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('d83b542d6e4d79c076198074299974233994564f1d1411162f6dbc8d0e1b25e4')

package() {
	install -Dm755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
