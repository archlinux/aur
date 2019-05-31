# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.68.1
pkgrel=1
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm-bin')

source=("helmfile_linux_amd64_$pkgver::https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('1a2333cc2b0b9fa425cf77565a15cc623f32ccfaba62e5c2839ae559918c1fd1')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64_$pkgver "$pkgdir/usr/bin/helmfile"
}

