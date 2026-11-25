# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-cost-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="kubectl plugin that shows the cost of Kubernetes workloads"
arch=('x86_64')
url="https://github.com/kubecost/kubectl-cost"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-cost-linux-amd64.tar.gz")
sha256sums_x86_64=('1b9a768763b3a0dbcd8570935ad60c376542f137550abe049dd63fcec68a0eaf')

package() {
  install -Dm755 "kubectl-cost" "${pkgdir}/usr/bin/kubectl-cost"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
