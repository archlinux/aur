# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubepug-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Kubernetes PreUpGrade (Checker)"
arch=('x86_64')
url="https://github.com/rikatz/kubepug"
license=('Apache')
source=("https://github.com/rikatz/kubepug/releases/download/v${pkgver}/kubepug_linux_amd64.tar.gz")
sha256sums=('c09d7d06715ced8140950233319f0a749628da0ca21558bd6253e9777ca312f3')

package() {
  install -Dm 755 "$srcdir/kubepug" "$pkgdir/usr/bin/kubepug"
}
