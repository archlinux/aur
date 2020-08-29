# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.4.0
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kubecom_${pkgver}_Linux_x86_64.tar.gz", "kube-commander")
sha256sums=('0efb22a6d3a2aa6dc41685ee38842f21b798083e0526d060630e01614f1e406c', 'a51f5f19cce7700895f32ab96e6cf167e184e0f7e7ebe5b228c5e9283672d459')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubecom "$pkgdir/usr/bin/kubecom"
}
