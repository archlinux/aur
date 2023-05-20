# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=cloudsend
pkgver=2.2.8
pkgrel=1
pkgdesc="Bash script that uses curl to send files to a nextcloud/owncloud shared folder"
url="https://github.com/tavinus/cloudsend.sh"
license=("AGPL-3.0")
arch=('any')
depends=('bash' 'curl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/-$pkgver.tar.gz")
sha512sums=('7ea9e8de2803d948deb928b78e26bca0a1b3d96117210c4a079aea1fbb711a74f4a6680220f9bcdf867f0b9b62085e211389943191d100fc4887446070cd1a4a')

package() {
  install -Dm 755 "$srcdir/cloudsend.sh-$pkgver/cloudsend.sh" "$pkgdir/usr/bin/cloudsend.sh"
}
