pkgname=syscope-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Linux system diagnosis tool"
arch=('x86_64')
url="https://github.com/ashvin-to/syscope"
license=('GPL3')
depends=('glibc')
provides=('syscope')
conflicts=('syscope')

source=(
  "syscope::https://github.com/ashvin-to/syscope/releases/download/v${pkgver}/syscope"
)

sha256sums=('SKIP')

package() {
  install -Dm755 syscope "$pkgdir/usr/bin/syscope"
}
