# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.7.5
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.7.5::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.7.5/kubecom_0.7.5_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('ed6da11e7355e05b41b7046c3956a3321674a9214f6b7145f76ddfad4803b306' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.7.5 "$pkgdir/usr/bin/kubecom"
}
