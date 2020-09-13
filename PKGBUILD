# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.7.0
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.7.0::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.7.0/kubecom_0.7.0_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('c6920ec93c5552cd7c12403fdd6eca5fb0647522e376186904add1af6a97c353' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.7.0 "$pkgdir/usr/bin/kubecom"
}
