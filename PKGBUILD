# Maintainer: Kelsey <kelsey at the-dreamer dot dev>

pkgname=omorifortune
pkgver=1.0.0
pkgrel=1
pkgdesc="Omori-themed fortune-style cowsay quotes"
arch=('x86_64')
url="https://codeberg.org/kelseythedreamer/headspace-repo"
license=('GPL2')
depends=('lua' 'cowsay')
source=("omorifortune::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/omorifortune"
        "omorifortune.lua::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/omorifortune.lua"
        "messages-calm.lua::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/messages-calm.lua"
        "messages-dark.lua::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/messages-dark.lua"
        "README::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/README"
        "omori.cow::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/omori.cow"
        "something.cow::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/omorifortune/files/something.cow")
sha256sums=('09f220a605fd6a237f1367883e2179714dd819ad57b6d799c50b96ca163f62a7'
            '3ee03f02441827ddbca874420dcfa41337f6a8e54b5d4d560bbebf539811bf68'
            '68cc8ae97514cea2d949105e07387c5a96ed6453aaeb73a2b739dd4cb67a2bd4'
            '72dbe2fee6a09d3dd905ef849273b00cad0394d67392d3dd89ceea61d15080f9'
            '1a722c47b7c2aa3bd91f84eebbc8814e3a507a6f1443696b0017a69d24d6bb3a'
            '1b315f1c4203149010f1b88ff19e159fc63261187c4f108c9e48383adaa13bf5'
            '488794911426a51bbb796b5d443318ab65d759b7f5c1300487e576ecd4266908')

package() {
  install -Dm755 omorifortune "${pkgdir}/usr/bin/omorifortune"
  install -Dm644 omorifortune.lua "${pkgdir}/opt/omorifortune/omorifortune.lua"
  install -Dm644 messages-calm.lua "${pkgdir}/opt/omorifortune/messages-calm.lua"
  install -Dm644 messages-dark.lua "${pkgdir}/opt/omorifortune/messages-dark.lua"
  install -Dm644 README "${pkgdir}/opt/omorifortune/README"
  install -Dm644 omori.cow "${pkgdir}/usr/share/cowsay/cows/omori.cow"
  install -Dm644 something.cow "${pkgdir}/usr/share/cowsay/cows/something.cow"
}
