# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.7.11'
pkgrel='0'
pkgdesc="Tiling Window Manager written in Nim"
arch=('x86_64')
url="https://github.com/avahe-kellenberger/nimdow"
license=('GPL2')
source=("nimdow-$pkgver::$url/releases/download/v$pkgver/nimdow"
        "nimdow-config-$pkgver.toml::$url/raw/v$pkgver/config.default.toml"
        "nimdow.desktop")
md5sums=('7531f9db971ba56c2c612c2cc4a39c70'
         '5d06a88474803edb856ea6dc878de23e'
         '70260787d12b7f6a449943526a97247d')

package() {
  install -D "nimdow-$pkgver" "$pkgdir/usr/bin/nimdow"
  install -D "nimdow-config-$pkgver.toml" "$pkgdir/usr/share/nimdow/config.default.toml"
  install -D "nimdow.desktop" "$pkgdir/usr/share/xsessions/nimdow.desktop"
}

