# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=25.02.23
pkgrel=2
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=(any)
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("PKHeX.exe::https://downloads.dfagaming.nl/PKHeX.exe"
        "launcher"
        "icon.png"
        "pkhex.desktop")
sha256sums=('c29e967a381eb17e24071b4fc683581245321cc45b3a048c4d21386e3822e405'
            '75461298d645a23527517a17d24316d128f98c3c303cd382a1f749a139e35b4a'
            '688456b442d51a9cdcffeb053099f23e3333e492c5b9d9266e97da7cd077b89b'
            'ce9fe9dd5c0d3e9632704e5dea78128d5742afa72d5ed2fa4af3df545d1aaff1')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX.exe" "${pkgdir}/usr/share/pkhex/PKHeX.exe"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"
}
