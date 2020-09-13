# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.7.2
pkgrel=1
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.7.2::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.7.2/kubecom_0.7.2_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('b8e09c6fcacff44dfd5a056ee66e40b18d73753a4f83bae62d7b9ec4fe2ad92d' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.7.2 "$pkgdir/usr/bin/kubecom"
}
