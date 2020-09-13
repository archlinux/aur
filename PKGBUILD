# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.7.3
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.7.3::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.7.3/kubecom_0.7.3_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('8933e65dbb0062b63e6acce55ae80b0c59647dce957211a081af9771cd33cb04' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.7.3 "$pkgdir/usr/bin/kubecom"
}
