# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.5.5rc.2
pkgrel=8
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_0.5.5-rc.2::https://github.com/AnatolyRugalev/kube-commander/releases/download/0.5.5-rc.2/kubecom_0.5.5-rc.2_linux_amd64" 'kube-commander' 'kubectl-ui')
sha256sums=('80e56fac11f58627a3b6e53c625da2e5f4d176edd6128d883aa28b9a6832c568' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubectl-ui "$pkgdir/usr/bin/kubectl-ui"
  install -m755 kubecom_0.5.5-rc.2 "$pkgdir/usr/bin/kubecom"
}
