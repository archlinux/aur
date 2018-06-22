# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.3.0
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(gtk-update-icon-cache)
optdepends=("mint-x-icons: enable additional icons to inheritage")
conflicts=(mint-y-icons-git)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('e327656780492de93804e7e0ec5e16893bd2e948709328ad6f2bab781738361d')

#prepare() {
#	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
#	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
#}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}
