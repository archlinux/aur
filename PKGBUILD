# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=cloudsend
pkgver=2.3.0
pkgrel=1
pkgdesc="Bash script that uses curl to send files to a nextcloud/owncloud shared folder"
url="https://github.com/tavinus/cloudsend.sh"
license=("AGPL-3.0")
arch=('any')
depends=('bash' 'curl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6ef27ee58ec5f49908788327ed446ba17c0ebdfbbe4c16330c8c148c4dc7e0fabbbf1582a8783798364b79d56cedf1a791cbf5a9e3aeea0fd952e7cb7e3d014b')

package() {
  install -Dm 755 "$srcdir/cloudsend.sh-$pkgver/cloudsend.sh" "$pkgdir/usr/bin/cloudsend.sh"
}
