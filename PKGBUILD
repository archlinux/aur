# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.6.1
pkgrel=2
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.6.1::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.6.1/kubecom_0.6.1_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('dd61d099c3bd2cda1c7e2543221618afee176998ef847d42a1cb2f9b6cecd833' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.6.1 "$pkgdir/usr/bin/kubecom"
}
