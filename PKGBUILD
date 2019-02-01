# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.44.0
pkgrel=1
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm-bin')

source=("helmfile_linux_amd64_$pkgver::https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('4ee0dbac4c2ec1063658debd0e2f17d1909f63b54f45e20d1007fbeb16e9ba44')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64_$pkgver "$pkgdir/usr/bin/helmfile"
}

