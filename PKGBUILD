# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.7.35'
pkgrel='0'
pkgdesc="Tiling Window Manager written in Nim"
arch=('x86_64')
url="https://github.com/avahe-kellenberger/nimdow"
license=('GPL2')
source=("nimdow-$pkgver::$url/releases/download/v$pkgver/nimdow"
        "nimdow-config-$pkgver.toml::$url/raw/v$pkgver/config.default.toml"
        "nimdow-$pkgver.1::$url/raw/v$pkgver/doc/nimdow.1"
        "nimdow.desktop")

package() {
  install -D "nimdow-$pkgver" "$pkgdir/usr/bin/nimdow"
  install -D "nimdow-config-$pkgver.toml" "$pkgdir/usr/share/nimdow/config.default.toml"
  install -D "nimdow-$pkgver.1" "$pkgdir/usr/share/man/man1/nimdow.1"
  install -D "nimdow.desktop" "$pkgdir/usr/share/xsessions/nimdow.desktop"
}

sha256sums=('d6ed2e31a06dba74d4031dda4d9f82fd077823c6393f04a522986bf4e7bc9898'
            '4f3513f939d59b4aa3e02967c3c87f32872397088c5a66163926ff14cf56a974'
            'fdeb229d47bfdbfe7796fc6b07196e9a5cbd3863433cc4566be352d7013cccd6'
            'ee60c4eb3150e7ec7d69f233a186f90626cc342f51ca6d58eb76e2efa00783c7')
