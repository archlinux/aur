# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.5.3
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kubecom_${pkgver}_Linux_x86_64.tar.gz" 'kube-commander')
sha256sums=('9b33ae5b5c2b57da1b2f9951ad86686f834397b0fcfc2e47c1acb6da6a0c9d65' 'a51f5f19cce7700895f32ab96e6cf167e184e0f7e7ebe5b228c5e9283672d459')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubecom "$pkgdir/usr/bin/kubecom"
}
