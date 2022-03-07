# Maintainer: shmilee.zju <shmilee.zju@gmail.com>
_zip_name=repository.xbmc-addons-chinese

pkgname=xbmc-addons-chinese
pkgver=2.0.0
pkgrel=1
pkgdesc="Addon scripts, plugins, and skins for kodi(XBMC) Media Center. Special for chinese laguage."
arch=('any')
url="https://github.com/taxigps/xbmc-addons-chinese/"
license=('GPLv2')
depends=('kodi')
install=install
source=("https://github.com/taxigps/${pkgname}/raw/matrix/repo/${_zip_name}/${_zip_name}-${pkgver}.zip")
md5sums=('d9d06df991020413d7c599d2a3034a88')

package() {
    cd ${srcdir}/
    install -dm755 ${pkgdir}/usr/share/kodi/addons/
    find $_zip_name -type f -exec install -Dm644 {} ${pkgdir}/usr/share/kodi/addons/{} \;
}
