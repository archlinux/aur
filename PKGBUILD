# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.7.37'
pkgrel='1'
pkgdesc="Tiling Window Manager written in Nim"
arch=('x86_64')
url="https://github.com/avahe-kellenberger/nimdow"
license=('GPL2')
source=("nimdow-$pkgver::$url/releases/download/v$pkgver/nimdow"
        "nimdow-config-$pkgver.toml::$url/raw/v$pkgver/config.default.toml"
        "nimdow-$pkgver.1::$url/raw/v$pkgver/doc/nimdow.1"
        "nimdow.desktop")
provides=('nimdow')
conflicts=('nimdow')

package() {
  install -Dm0755 "nimdow-$pkgver" "$pkgdir/usr/bin/nimdow"
  install -Dm0644 "nimdow-config-$pkgver.toml" "$pkgdir/usr/share/nimdow/config.default.toml"
  install -Dm0644 "nimdow-$pkgver.1" "$pkgdir/usr/share/man/man1/nimdow.1"
  install -Dm0644 "nimdow.desktop" "$pkgdir/usr/share/xsessions/nimdow.desktop"
}

sha256sums=('6691eb1513d57ba694c7e4a059989e18fff77e5239f154de8e8ab028f41eeb8a'
            '9e297cee1179b85fa92da14b4fe73ef1ac3ff65bd5d21c015d794cb7dad86374'
            'fdeb229d47bfdbfe7796fc6b07196e9a5cbd3863433cc4566be352d7013cccd6'
            'ee60c4eb3150e7ec7d69f233a186f90626cc342f51ca6d58eb76e2efa00783c7')
