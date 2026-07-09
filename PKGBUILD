# Maintainer: metaphy <metaphyman [at] proton [dot] me>
pkgname=kubedock-bin
pkgver=0.22.0
pkgrel=1
epoch=
pkgdesc="Kubedock is a minimal implementation of the docker api that will orchestrate containers on a Kubernetes cluster, rather than running containers locally."
arch=('x86_64')
url="https://github.com/joyrex2001/kubedock"
license=('MIT')
source=("https://github.com/joyrex2001/kubedock/releases/download/${pkgver}/kubedock_linux_x86_64.tar.gz")
sha256sums=('dca544dafcd39857b1d777508bc9a275c37b2db33d428f840dec66eea27e927e')

package() {
    cd $srcdir
    install -Dm 755 "kubedock" "$pkgdir/usr/bin/kubedock"
}
