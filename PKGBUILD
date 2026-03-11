# Maintainer: Frédéric Logier <fredix@nomad.wf>
_name=uncloud
pkgname=uncloud
pkgver=0.17.1
pkgrel=1
epoch=
pkgdesc="A lightweight tool for deploying and managing containerised applications across a network of Docker hosts. Bridging the gap between Docker and Kubernetes ✨"
arch=('x86_64')
url="https://github.com/psviderski/uncloud"
license=('Apache-2.0')
groups=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_name}")
conflicts=("${_name}")
replaces=()
backup=()
options=('!lto')
install=
changelog=
source=("${url}/releases/download/v${pkgver}/uncloud_linux_amd64.tar.gz")

noextract=()
sha256sums=("SKIP")
validpgpkeys=()

package() {
    # Create package directory if it doesn't exist
    mkdir -p "$pkgdir/usr/bin"

    # Extract archive to the package directory
    tar -xvzf ${srcdir}/uncloud_linux_amd64.tar.gz -C "${pkgdir}/usr/bin/"

    # Clean up
    rm -f ${srcdir}/uncloud_linux_amd64.tar.gz
}
