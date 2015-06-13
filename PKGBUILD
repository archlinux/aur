# Maintainer: shmilee.zju <shmilee.zju@gmail.com>
_zip_name=repository.xbmc-addons-chinese

pkgname=xbmc-addons-chinese
pkgver=1.2.0
pkgrel=2
pkgdesc="Addon scripts, plugins, and skins for kodi(XBMC) Media Center. Special for chinese laguage."
arch=('any')
url="https://github.com/taxigps/xbmc-addons-chinese/"
license=('GPLv2')
depends=('xbmc')
install=install
source=("https://github.com/taxigps/${pkgname}/raw/master/repo/${_zip_name}/${_zip_name}-${pkgver}.zip")
md5sums=('dbe8eff47bebb0634d32fdd88a0b0b8b')

package() {
    cd ${srcdir}/
    install -dm755 ${pkgdir}/usr/share/kodi/addons/
    find $_zip_name -type f -exec install -Dm644 {} ${pkgdir}/usr/share/kodi/addons/{} \;
}
