# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.7.6
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.7.6::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.7.6/kubecom_0.7.6_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('40df212bcd83e8ad414fe051a8a9bbcd3af43ede9663a119f22bcf3fb911db41' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.7.6 "$pkgdir/usr/bin/kubecom"
}
