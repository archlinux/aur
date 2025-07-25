pkgname=pawdance
pkgver=4.5.1
pkgrel=1
pkgdesc="paws to paws, a stealth-grade, post-quantum SSH VPN"
arch=('any')
url="https://git.protogen.engineering/racks/pawdance"
license=('GPL3')
depends=('bash' 'iproute2' 'iptables' 'openssh' 'bind' 'procps-ng')
source=("https://git.protogen.engineering/racks/pawdance/archive/release.tar.gz")
sha256sums=('a37d9f585b8ea1802c1e07d0d28dbc0e2294573084f7808f384074a3f7aaf7ce')

package() {
  cd "$srcdir/pawdance"

  install -Dm755 pawdance "$pkgdir/usr/bin/pawdance"

  # Optional: README
  [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

