# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pilgo-bin
_binname=plg
pkgver=0.4.0
pkgrel=1
pkgdesc='Configuration-based symlink farm manager CLI and framework'
arch=('x86_64')
url='https://github.com/gbrlsnchs/pilgo'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/linux.tar.gz")
sha256sums=('c591951ac616378dd9f196b4088d9a7fe961a4f0ffe65a3b37affc560fe4899c')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "$_binname" "$pkgdir/usr/bin/$_binname"
}
