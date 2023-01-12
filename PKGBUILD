# Maintainer: Soma Yamamoto <soya[underscore]daizu[at]proton[dot]me>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

_pkgname=crystalline
pkgname=crystalline-bin
pkgver=0.8.0
pkgrel=0
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
source=(
  "$_pkgname.gz::https://github.com/elbywan/crystalline/releases/download/v${pkgver}/crystalline_x86_64-unknown-linux-musl.gz"
  "LICENSE::https://raw.githubusercontent.com/elbywan/crystalline/master/LICENSE"
)
noextract=(LICENSE)

provides=(crystalline)
conflicts=(crystalline)

package() {
  cd "$srcdir"
  install -D -m 0755 crystalline ${pkgdir}/usr/bin/crystalline
  install -D -m 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

sha512sums=('9ac56522b15e9fe8f0734ae2812944f245fdb28062177343b95ee1eb54c420ee187fbcf6d2fda7d56cb8d88d1d2886a290170acb073698ecbf01ad81656de555'
            '81cab25a58a3e23f1548e7fcf11934cf6146af6a407292b4d043458da24803fe4c489f1f2a69d033623557eeaa2908efb26bf4750908e271b13e0406bc4203c7')
