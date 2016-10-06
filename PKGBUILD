# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=2.1
pkgrel=9
pkgdesc="Maintenance , backup and system checks in a menu driven  Bash script"
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
)
#source=("git://github.com/gavinlyonsrepo/${pkgname}.git")
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")
md5sums=('7e6973306b95e8d91a45b64253ac55cd')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 Cylon.sh "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 Readme.md "$HOME"/.config/cylon/cylonReadme.md
    install -D -m644 License.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"
}
