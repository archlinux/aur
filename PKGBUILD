# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=kde-applications-nogames-nodevel-noedu-meta
pkgname=(kde-applications-nogames-nodevel-noedu-meta
         kde-sdk-nodevel-meta)
pkgver=22.12
pkgrel=1
arch=(any)
license=(None)
url='https://www.archlinux.org/'

package_kde-applications-nogames-nodevel-noedu-meta() {
  pkgdesc='Meta package for KDE Applications without games'
  depends=(kde-accessibility-meta
           kde-graphics-meta
           kde-multimedia-meta
           kde-network-meta
           kde-pim-meta
           kde-sdk-nodevel-meta
           kde-system-meta
           kde-utilities-meta)
  provides=(kde-applications-meta kde-games-meta kde-education-meta)
  conflicts=(kde-applications-meta kde-games-meta kde-education-meta)
}

package_kde-sdk-nodevel-meta() {
  pkgdesc='Meta package for KDE SDK applications - nodevel'
  replaces=(kdesdk-meta)
  provides=(kde-sdk-meta)
  conflicts=(kde-sdk-meta)
  depends=(dolphin-plugins
           kirigami-gallery
           kdesdk-thumbnailers)
}
