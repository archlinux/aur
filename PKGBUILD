# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

_pkgname=crystalline
pkgname=crystalline-bin
pkgver=0.12.2
pkgrel=1
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

sha512sums=('fea3d4930c1f6c4029aa38f41d894cb77f00096c6000a15f566ee35e6209203d8f7b271ee35f98386a5430b2678191e16281913b737394d199c8e715c7a83f59'
            '81cab25a58a3e23f1548e7fcf11934cf6146af6a407292b4d043458da24803fe4c489f1f2a69d033623557eeaa2908efb26bf4750908e271b13e0406bc4203c7')
