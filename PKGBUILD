# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.7.23'
pkgrel='0'
pkgdesc="Tiling Window Manager written in Nim"
arch=('x86_64')
url="https://github.com/avahe-kellenberger/nimdow"
license=('GPL2')
source=("nimdow-$pkgver::$url/releases/download/v$pkgver/nimdow"
        "nimdow-config-$pkgver.toml::$url/raw/v$pkgver/config.default.toml"
        "nimdow-$pkgver.1::$url/raw/v$pkgver/doc/nimdow.1"
        "nimdow.desktop")
sha256sums=('1b8add75add7fc3e41b1e23441c76e5b4a845cdcb017ecfede7e3eb4a197f67b'
            'fbf06c5a98e6fe5a6f14a2b607f597f50d20cf43842ceabb296883c29cd711b4'
            '191c2fe567d75f7cd0347a0fe16f3b4ea38126a35cb2c92ff9a501cc15ec1c53'
            'ee60c4eb3150e7ec7d69f233a186f90626cc342f51ca6d58eb76e2efa00783c7')

package() {
  install -D "nimdow-$pkgver" "$pkgdir/usr/bin/nimdow"
  install -D "nimdow-config-$pkgver.toml" "$pkgdir/usr/share/nimdow/config.default.toml"
  install -D "nimdow-$pkgver.1" "$pkgdir/usr/share/man/man1/nimdow.1"
  install -D "nimdow.desktop" "$pkgdir/usr/share/xsessions/nimdow.desktop"
}

