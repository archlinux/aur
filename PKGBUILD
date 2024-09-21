# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.7.39'
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

sha256sums=('861564b5ab8dd7b16a0824ede1db750817f3f624cd2a730a67cf2d70341d1ec6'
            '8074abcac266a5d8500df25520eb734ad3e592927177fcd100b3174e6e33fb93'
            'fdeb229d47bfdbfe7796fc6b07196e9a5cbd3863433cc4566be352d7013cccd6'
            'ee60c4eb3150e7ec7d69f233a186f90626cc342f51ca6d58eb76e2efa00783c7')
