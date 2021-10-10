# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=kubescape-bin
pkgver=1.0.109
pkgrel=1
pkgdesc="kubescape is the first tool for testing if Kubernetes is deployed securely as defined in Kubernetes Hardening Guidance by to NSA and CISA"
provides=('kubescape')
arch=('x86_64')
url="https://github.com/armosec/kubescape"
license=("APACHE")
source=(
https://github.com/armosec/kubescape/releases/download/v${pkgver}/kubescape-ubuntu-latest
)
sha256sums=(
323e734cd5a87eb5b79adb51649bd8315746da4292a15e4df822fee6ef9368b4
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/kubescape-ubuntu-latest" "$pkgdir/usr/bin/${provides}"
}
