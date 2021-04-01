# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=steamautologin-bin
_pkgname=steamautologin
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt Steam account switcher for Linux"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=(
    $url/releases/download/$pkgver/SteamAutoLogin
    'SteamAutoLogin.desktop'
)
sha256sums=(
    '108743ef0f6dbed905ce4785a3a8e68bdf9953eff1f82edd7202dda3140c6112'
    '2f6f39f0578c3b25038bd2e7f92149ccee0960b2d98780b461002c4e78a915d8'
)

package() {
  install -Dm755 SteamAutoLogin "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 SteamAutoLogin.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
