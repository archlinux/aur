# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.7.29'
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

sha256sums=('6424e926077260ceac0cf535921f622506768d53b6a35131f8d6c1b7bdcd4825'
            '850c1766532699f5275ba70812336864c7d9356f6c9e5f7973a57c5e1f5f0d38'
            '05ed7a86f30c7745602ad71831d91ccf3d13f5bd19908842b7179b865be48647'
            'ee60c4eb3150e7ec7d69f233a186f90626cc342f51ca6d58eb76e2efa00783c7')
