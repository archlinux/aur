pkgname=ashes-2063
pkgver=2.3
pkgrel=3
pkgdesc="Ashes is a Post-apocalypse themed total conversion for the GZDoom engine."
arch=(any)
url="https://www.moddb.com/mods/ashes-2063"
license=(GPL3)
depends=('gzdoom')
optdepends=('doomseeker')
source=("AshesEp1_2063_V2_3::https://www.moddb.com/downloads/mirror/226759/128/d094c864970bbc0eba1f3d9c65162522/?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fashes-2063%2Fdownloads"
        "AshesEp2_Afterglow_V1_10::https://www.moddb.com/downloads/mirror/226758/131/441ea9642a3e4f3b9340b7bab175a1d1/?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fashes-2063%2Fdownloads")
sha256sums=('cf6892fb8341b571c29730b47b5c068eeb4be2455ffecc044f6938a192882dd5'
            'a2ac4187ee5e7fccce674532923703abc3338b0e801b8078059c44b4be791f12')

package() {
    mkdir -p "$pkgdir/usr/share/games/$pkgname/"
    install -Dm644 "Ashes2063Enriched2_23.pk3" "$pkgdir/usr/share/games/$pkgname/Ashes2063Enriched2_23.pk3"
    install -Dm644 "AshesAfterglow1_10.pk3" "$pkgdir/usr/share/games/$pkgname/AshesAfterglow1_10.pk3"
}
