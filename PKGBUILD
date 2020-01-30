# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname="dracut-hook"
pkgver=0.2
pkgrel=1
pkgdesc="dracut hook for archlinux"
arch=('any')
url="https://tackitt.net"
license=('BSD')
depends=('dracut')
noextract=()
source=(
  "dracut-install"
  "90-dracut-install.hook"
)
md5sums=('aa3097b708237e0a3b3a357dab6fd4e6'
         '8fa0ed0a9aa50f2ac6525d3264f04d76')

package() {
  install -Dm755 "$srcdir/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm755 "$srcdir/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
}
