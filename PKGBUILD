# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.7.4
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.7.4::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.7.4/kubecom_0.7.4_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('af21f62aad2ff1337b2acaa0fbc346f37042ccb64ebd39e2c1e6768c6b48be0c' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.7.4 "$pkgdir/usr/bin/kubecom"
}
