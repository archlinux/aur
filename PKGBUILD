# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=wine-mono-gecko-version-fix
pkgver=1.0.0
pkgrel=1
pkgdesc="Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine."
arch=(any)
url="https://www.fkxxyz.com/learn/wine-mono/"
license=('GPL3')
depends=('pacman' 'wine')
optdepends=('wine-mono' 'wine-gecko')
source=(
  "wine-mono-version-fix.hook"
  "wine-gecko-version-fix.hook"
)

package() {
  install -D "wine-mono-version-fix.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/wine-mono-version-fix.hook"
  install -D "wine-gecko-version-fix.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/wine-gecko-version-fix.hook"
}

# vim:set ts=2 sw=2 et:
md5sums=('2f2958c8de920209c09a168cd75e04c7'
         '20d6893254eb74cfb6e79c30af59977a')
         
