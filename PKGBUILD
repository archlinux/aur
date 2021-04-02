# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=steamautologin-bin
_pkgname=steamautologin
pkgver=0.1.1
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
    'bc9764d9363e92601b8ae2515273e13c76ada1a21253a8e8bc5eff208dad34c4'
    '78dcfa54918d122e779ee6cb843c87c2a272523e258ec22774d4826ec23def1d'
)

package() {
  install -Dm755 SteamAutoLogin "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 SteamAutoLogin.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
