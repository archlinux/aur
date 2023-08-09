pkgname=ashes-2063
pkgver=2.3
pkgrel=2
pkgdesc="Ashes is a Post-apocalypse themed total conversion for the GZDoom engine."
arch=(any)
url="https://www.moddb.com/mods/ashes-2063"
license=(GPL3)
depends=('gzdoom')
optdepends=('doomseeker')
source=("AshesEp1_2063_V2_3::https://www.moddb.com/downloads/mirror/226757/122/0f30e377ab652f0e9614d730269b7d0e/?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fashes-2063%2Fdownloads"
        "AshesEp2_Afterglow_V1_10::https://www.moddb.com/downloads/mirror/226758/122/046b98a590150f4a4e6f5b7e78e16672/?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fashes-2063%2Fdownloads")
sha256sums=('92f6903ce5bb820c9cfdb593679e8b3fde5f290616999b63301771f2bb76aec4'
            'a2ac4187ee5e7fccce674532923703abc3338b0e801b8078059c44b4be791f12')

package() {
    mkdir -p "$pkgdir/usr/share/games/$pkgname/"
    install -Dm644 "Ashes2063Enriched2_23.pk3" "$pkgdir/usr/share/games/$pkgname/Ashes2063Enriched2_23.pk3"
    install -Dm644 "AshesAfterglow1_10.pk3" "$pkgdir/usr/share/games/$pkgname/AshesAfterglow1_10.pk3"
}
