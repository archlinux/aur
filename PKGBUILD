# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=cloudsend
pkgver=2.3.9
pkgrel=1
pkgdesc="Bash script that uses curl to send files to a nextcloud/owncloud shared folder"
url="https://github.com/tavinus/cloudsend.sh"
license=("AGPL-3.0")
arch=('any')
depends=('bash' 'curl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('60a5f606299834e04636baa696b18ee021416c4eccfaf8f73526c4873aac2011b9349fdbd1f1babd5aca0dc2e7385e193f86751ad17cee5f2c60fdadc877a15a')

package() {
  install -Dm 755 "$srcdir/cloudsend.sh-$pkgver/cloudsend.sh" "$pkgdir/usr/bin/cloudsend.sh"
}
