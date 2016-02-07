# Maintainer: Emil Lundberg <lundberg.emil@gmail.com> (AUR: Lorde; GitHub: emlun)
# Contributor: Justin Patera serialhex@gmail.com

pkgname=btsync-autoconfig
pkgver=2.0.0
pkgrel=1
pkgdesc="Create default config files when users launch btsync, if necessary"
arch=('any')
url='https://github.com/emlun/btsync-autoconfig'
license=('GPL')
depends=('btsync')
makedepends=('git')
install="${pkgname}.install"
source=("${install}"
        "git+${url}.git#tag=${pkgver}")
md5sums=('b9ce24af305d037b97a2e106cd9aa936'
         'SKIP')
sha256sums=('244652e90656babb5383168c4ec65491ce676fe9a6dfa6a26fbfad9d33b03bdf'
            'SKIP')

package() {
    cd "${pkgname}"
    make install DESTDIR="${pkgdir}" PKGNAME="${pkgname}"
}
