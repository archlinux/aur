# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=3.0
pkgrel=1
pkgdesc="Updates, Maintenance, backup and system checks in a menu driven Bash script"
arch=('any')
url="https://github.com/gavinlyonsrepo/cylon"
license=('GPL')
optdepends=(
  'cower: AUR package for AUR work'
  'gdrive: AUR package for google drive backup'
  'lostfiles: AUR package for finding lost files'
  'pacaur: AUR helper'
  'rmlint: Finds lint and other unwanted'
  'rkhunter: finds root kits malware'
  'clamav: used for finding malware'
  'bleachbit: used for system clean'
  'gnu-netcat: used for checking network'
  'ccrypt: used for encrypting'
  'rsync: used for backup'
  'inxi: system information viewer'
  'htop: interactive process viewer'
  'wavemon: wireless network monitor'
  'speedtest-cli: internet bandwidth'
  'lynis: system audit tool'
  
)
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")
md5sums=('53233eeb97e9982176e4269ad3a1df2f')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 Cylon.sh "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 Readme.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 changelog.md "$pkgdir/usr/share/doc/${pkgname}/changelog.md"
    install -D -m644 License.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"
}
