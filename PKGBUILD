# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0s-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="k0s - Zero Friction Kubernetes"
arch=('x86_64')
url="https://github.com/k0sproject/k0s"
license=('Apache')
source=("https://github.com/k0sproject/k0s/releases/download/v${pkgver}/k0s-v${pkgver}-amd64")
sha256sums=('2018b7cfe564951bf42079cb402bd7d57c4cc9a9621e1ae3cdadc6f0e8ba1f93')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0s-v${pkgver}-amd64" "$pkgdir/usr/bin/k0s"
}
