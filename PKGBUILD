# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=2.2
pkgrel=1
pkgdesc="Updates, Maintenance, backup and system checks in a menu driven Bash script"
arch=('any')
url="https://github.com/gavinlyonsrepo/cylon"
license=('GPL')
optdepends=(
  'cower: AUR package for AUR work'
  'gdrive: AUR package for google drive backup'
  'lostfiles: AUR package for finding lost files'
  'rmlint: Finds lint and other unwanted'
  'rkhunter: finds root kits malware'
  'clamav: used for finding malware'
  'bleachbit: used for system clean'
  'gnu-netcat: used for checking network'
  'ccrypt: used for encrypting'
)
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")
md5sums=('dc164e42ad8cc49008f3c0d705dc676a')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 Cylon.sh "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 Readme.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 changelog.md "$pkgdir/usr/share/doc/${pkgname}/changelog.md"
    install -D -m644 License.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"
}
