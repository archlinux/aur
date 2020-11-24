# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=wine-mono-gecko-version-fix
pkgver=1.0.1
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
  install -Dm644 "wine-mono-version-fix.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/wine-mono-version-fix.hook"
  install -Dm644 "wine-gecko-version-fix.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/wine-gecko-version-fix.hook"
}

# vim:set ts=2 sw=2 et:
md5sums=('48e76371af53002714ff5e1a9c4d6617'
         'd6ad765c083ea5a61c61fa43876f4832')
         
