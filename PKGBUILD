# Maintainer: zoe <chp321@gmail.com>

pkgname=kfoldersync
pkgver=3.4.1
pkgrel=4
pkgrel_=7.71
pkgdesc="Folder synchronization and backup tool for KDE"
arch=('x86_64')
url="https://www.linux-apps.com/content/show.php/${_pkgname}?content=164092"
license=('GPLv2')
depends=('plasma-workspace' 'hicolor-icon-theme' 'kconfigwidgets5' 'kdbusaddons5' 'kitemviews5' 'kwindowsystem5' 'kxmlgui5')
#makedepends=('extra-cmake-modules' 'phonon-qt5-gstreamer')
#source=("https://dl.opendesktop.org/api/files/downloadfile/id/$_id1/s/$_id2/t/$_id3/u/$_id4/${pkgname}-${pkgver}.tar.xz"
source=("https://download.opensuse.org/repositories/home:/ecsos:/Backup/openSUSE_Tumbleweed/x86_64/${pkgname}-${pkgver}-${pkgrel_}.x86_64.rpm"
        "https://download.opensuse.org/repositories/home:/ecsos:/Backup/openSUSE_Tumbleweed/noarch/${pkgname}-lang-${pkgver}-${pkgrel_}.noarch.rpm"
        "${pkgname}.install")
install=${pkgname}.install
md5sums=('a58faf904a2ed6a23676c7f098a3a8bf' '0e3e07bd873489f532f17dde9ec28fbe' '262fc1597fb332894d1367f510a7f39b')

build()
{
  cd ${srcdir}
}

package()
{
  mv usr/ ${pkgdir}/
  rm "${pkgdir}/usr/share/doc/packages/${pkgname}/COPYING.GPL3"
  rm "${pkgdir}/usr/share/doc/packages/${pkgname}/README.md"
  rmdir "${pkgdir}/usr/share/doc/packages/${pkgname}/"
  rmdir "${pkgdir}/usr/share/doc/packages/"
  rmdir "${pkgdir}/usr/share/doc/"
}
