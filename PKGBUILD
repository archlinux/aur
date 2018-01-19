pkgname=nm-duid
pkgver=0.1
pkgrel=1
_commit=c4304cbf229f6504030ac1327164fe87bf5ca996
pkgdesc="Small tool to calculate the NetworkManager generated DHCPv6 DUID"
arch=('i686' 'x86_64')
url="https://github.com/mss/nm-duid"
depends=('perl')
source=("git+https://github.com/mss/nm-duid.git#commit=$_commit")
sha256sums=('SKIP')

package() {
  cd "$srcdir/nm-duid"

  install -Dm755 nm-duid "$pkgdir/usr/bin/nm-duid"
}
