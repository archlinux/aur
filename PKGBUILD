#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
pkgname="forgejo-runner"
pkgver=3.0.1
pkgrel=1
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('Expat')
source_x86_64=("${pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v3.0.1/${pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('5fa729c3ed9919a81f8525d7ac73e2621a7b3b4fa8d8761f8cb5582c2ba84b69')
source_aarch64=("${pkgname}::https://code.forgejo.org/forgejo/runner/releases/download/v3.0.1/${pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('fc6df24ba8661fd1e3fd3914b28c19f52aefb63ac8c1cb2d06560edd41cebcee')

package() {
	install -Dm755 ${pkgname} $pkgdir/usr/bin/${pkgname}
}
