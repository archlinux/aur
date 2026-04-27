pkgname=sysmonitor
pkgver=1.0
pkgrel=1
pkgdesc="Lightweight terminal system monitor script"
arch=('any')
url="https://github.com/serverjonas/sysmonitor"
license=('MIT')

depends=('bash' 'coreutils' 'iproute2' 'pciutils')

source=("https://github.com/serverjonas/sysmonitor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/sysmonitor-${pkgver}"

  install -Dm755 sysmonitor "$pkgdir/usr/bin/sysmonitor"
}
