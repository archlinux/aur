# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pilgo-bin
_binname=plg
pkgver=0.4.0
pkgrel=2
pkgdesc='Configuration-based symlink farm manager CLI and framework'
arch=('x86_64')
url='https://github.com/gbrlsnchs/pilgo'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/linux.tar.gz")
sha256sums=('cdd17a47ae8d89404416df2fc151cf287b638a06ee3b29e286a635565017cdab')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "$_binname" "$pkgdir/usr/bin/$_binname"
}
