# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=steamautologin-bin
_pkgname=steamautologin
pkgver=0.0.0
pkgrel=1
pkgdesc="Qt GUI Steam account switcher for Linux"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=(
    $url/releases/download/$pkgver/SteamAutoLogin
    'SteamAutoLogin.desktop'
)
sha256sums=(
    'e5f3563b50d1614b77b4c6e3bb2f334203783655a791211e533434f2a9963e25'
    '2b352b8864b05fa9ebd26eba3383a42660223d89f5f8c97f0211004736c830fd'
)

package() {
  install -Dm755 SteamAutoLogin "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 SteamAutoLogin.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
