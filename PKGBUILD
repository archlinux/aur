# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.6.2
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.6.2::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.6.2/kubecom_0.6.2_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('37bbf8c7c484be2923a161553e550a09db93819baeb0806f3da06bb5696d7cb2' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.6.2 "$pkgdir/usr/bin/kubecom"
}
