# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.5.1
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kubecom_${pkgver}_Linux_x86_64.tar.gz" 'kube-commander')
sha256sums=('7ac51e47a5e3f5eef71f48105c379dcb8bc5ae9cd7926a6a440c8391f4bd05cc' 'a51f5f19cce7700895f32ab96e6cf167e184e0f7e7ebe5b228c5e9283672d459')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubecom "$pkgdir/usr/bin/kubecom"
}
