# Maintainer: shmilee.zju <shmilee.zju@gmail.com>
_zip_name=repository.xbmc-addons-chinese

pkgname=xbmc-addons-chinese
pkgver=1.2.1
pkgrel=1
pkgdesc="Addon scripts, plugins, and skins for kodi(XBMC) Media Center. Special for chinese laguage."
arch=('any')
url="https://github.com/taxigps/xbmc-addons-chinese/"
license=('GPLv2')
depends=('kodi')
install=install
source=("https://github.com/taxigps/${pkgname}/raw/master/repo/${_zip_name}/${_zip_name}-${pkgver}.zip")
md5sums=('8d03299a46ee4aee8f8cda4e896345ca')

package() {
    cd ${srcdir}/
    install -dm755 ${pkgdir}/usr/share/kodi/addons/
    find $_zip_name -type f -exec install -Dm644 {} ${pkgdir}/usr/share/kodi/addons/{} \;
}
