# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.6.2'
pkgrel='0'
pkgdesc="Tiling Window Manager written in Nim"
arch=('x86_64')
url="https://github.com/avahe-kellenberger/nimdow"
license=('GPL2')
source=("nimdow-$pkgver::$url/releases/download/v$pkgver/nimdow"
        "nimdow-config-$pkgver.toml::$url/raw/v$pkgver/config.default.toml")
md5sums=('86f67faee6a2e3c09ae4415f2658ce64'
         '19f6a7ebfaf4ccb65871e466bc8dee1b')

package() {
  install -D "nimdow-$pkgver" "$pkgdir/usr/bin/nimdow"
  install -D "nimdow-config-$pkgver.toml" "$pkgdir/usr/share/nimdow/config.default.toml"
}

