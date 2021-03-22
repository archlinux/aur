# Maintainer : Yamada Hayao <development@fascode.net>
# Maintainer : lap1sid <development@fascode.net>

pkgname=lsd-control
_gitname=lsdcontrol
pkgver=1.2
pkgrel=2
pkgdesc='lsd command controller'
arch=('any')
url='https://fascode.net'
depends=('lsd')
source=("https://github.com/SereneTeam/lsdcontrol/archive/v${pkgver}.zip")
md5sums=('a13ff73e41f56ed94a28ca51ae703bdb')
conflicts=('lsd-control-git')

package() {
        cd "${_gitname}-${pkgver}" &&
        install -m 755 -D lsd-alias "${pkgdir}/usr/local/lib/lsd-alias"
        install -m 755 -D lsd-control "${pkgdir}/usr/local/bin/lsd-control"
}

