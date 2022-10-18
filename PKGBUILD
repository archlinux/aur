# Maintainer: Alessio Biancone <alebian1996@gmail.com>
pkgname=ringo-kms
pkgver=1.0.1
pkgrel=1
pkgdesc="wrapper for biscuit, can be used to select and decrypt the secrets in your project."
arch=('x86_64')
url="https://github.com/enrichman/ringo.git"
license=('GPL')
makedepends=('go' 'gox' 'tar')
depends=('biscuit-kms')
source=("https://github.com/enrichman/ringo/releases/download/v$pkgver/ringo-linux_amd64.tgz")
sha256sums=('49683704a3f3d57ad1ac6a4101a39924cf81190e5be2f914faf99b3763af8ba9')

package() {
        tar -xvzf "ringo-linux_amd64.tgz"

	install -D -m755 "ringo" "${pkgdir}/usr/bin/ringo"
}
