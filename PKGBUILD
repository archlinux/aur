# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=brutal-doom
pkgver=21
pkgrel=3
pkgdesc="Brutal Doom for the GZDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom"
license=(GPL3)
depends=(gzdoom)
optdepends=(doomseeker)
source=('http://doomshack.org/uploads/brutalv21.pk3'
        'https://nie.rs/doommetalvol5.wad'
        'brutal-doom'
        'gzdoom.ini'
        'brutal-doom.png'
        'brutal-doom.desktop'
        )
noextract=('brutalv21.pk3')
sha256sums=('e449e65604b1e9429099c7d3496830138425ba09c01fe49c08fb1c7acba7f6e0'
            '7d285d342ba27a432e7b795fa1b7656bb9bd7cb9680105a8d7d565677fc56a9f'
            '91f58cc1c670c5408100305463960c195200f8ad35619eedd2c531dc9c60badf'
            'aee3fd4580da214b9c981534928de5dfef65461c459d5c56dd343bf579912b75'
            '905cc17cccca54d3c4da821cdd974c8540deacd42534077ca4da9092c4a96074'
            '9c2b7a7cd048fd4e6a7fe65b93376cf2d9a9fa4564b8f3cc7b2baac38ea8e5f3'
            )

package() {
    install -Dm644 "brutalv21.pk3" "$pkgdir/usr/share/games/$pkgname/brutal-doom.pk3"
    install -m644 "doommetalvol5.wad" "$pkgdir/usr/share/games/$pkgname/doom-metal.wad"
    install -Dm755 "brutal-doom" "$pkgdir/usr/bin/brutal-doom"
    install -m644 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
    install -Dm644 "brutal-doom.png" "$pkgdir/usr/share/pixmaps/brutal-doom.png"
    install -Dm644 "brutal-doom.desktop" "$pkgdir/usr/share/applications/brutal-doom.desktop"
}
