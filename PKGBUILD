# Maintainer: Gohny <gohny277@gmail.com>
pkgname='davinconv'
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple script written in bash to convert videos using ffmpeg to the format supported by Davinci Resolve for Linux."
arch=('x86_64')
url="https://github.com/gohny/davinconv"
license=('GPL3')
depends=('ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dadba465482026d297df11fdf86404bb5e5cce870f97b95414cb23ae3d9e334b')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ./davinconv "$pkgdir/usr/bin/davinconv"
}
