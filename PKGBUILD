# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.6.0
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.6.0::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.6.0/kubecom_0.6.0_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('5ac6f4043ad54161bf026f18955dfcf57dcc2fb8a74832221da8880efc1ffa76' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.6.0 "$pkgdir/usr/bin/kubecom"
}
