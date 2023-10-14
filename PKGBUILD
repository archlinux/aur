# Maintainer: Lara Maia <dev@lara.monster>

pkgname=steamworks-sdk
pkgver=1.58
pkgrel=1
pkgdesc="The Steamworks SDK provides a range of features which are designed to help ship your application or game on Steam in an efficient manner."
arch=('any')
url="https://partner.steamgames.com/doc/sdk"
license=("custom:ValveSteamLicense")
source=("https://github.com/calendulish/Overlays/raw/master/dev-util/steamworks-sdk/files/steamworks_sdk_158.zip"
        "https://github.com/calendulish/Overlays/raw/master/licenses/ValveSteamLicense")
sha256sums=('4142982451d25120ddf35abf2b55499154b56132a16a7ccdae4806aaed5c99d0'
            'b411b1bc7c6d8690f477f701b697ce87f3e44d2b3fdab06a1bfb182898bf604e')

package() {
    mkdir -p "$pkgdir"/opt/steamworks-sdk/
    cp -r sdk/* "$pkgdir"/opt/steamworks-sdk/
    install -Dm644 ValveSteamLicense "$pkgdir"/usr/share/licenses/$pkgname/ValveSteamLicense
}
