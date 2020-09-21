# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel
pkgver=1.7.1
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/README.md"
        "users_${pkgver}.json::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/example/users.json"
	"LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/LICENSE")
source_i686=("chisel_${pkgver}_i686.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_386.gz")
source_x86_64=("chisel_${pkgver}_x86_64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_amd64.gz")
source_armv6h=("chisel_${pkgver}_armv6h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv6.gz")
source_armv7h=("chisel_${pkgver}_armv7h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv7.gz")
source_aarch64=("chisel_${pkgver}_aarch64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_arm64.gz")
sha256sums=('7b214f2da30a9586ee9db8a4d300641bfff869a9a7fcc04947a3d6fe205e8be0'
            'b3cb23ef88fcf4f39ee057289e7d2a92a03b2f33ec05caa4d70cd15a2ca60acd'
            '1edfe3540212ff667e460e212b31178e405139fdff18d643bdd49b05623ac3ac')
sha256sums_i686=('1d267caeb15c945b29b8a7c377582036ac1f72e2a977042947f149f099b5ffcb')
sha256sums_x86_64=('6e1611b4524f7426cbd8d7351b269a1239ee710e575e9e460fce110c35962de6')
sha256sums_armv6h=('a4e7e725eb3998e5dadef0f903eb5e5f3e2b879876b239a891de5f95ecb2c1c4')
sha256sums_armv7h=('5feea3420bc6019eda4db16b0c89d205ad258d54313782f236aacbf073bd33fa')
sha256sums_aarch64=('99b151997a57f29a3e3436bb4ebbe4357219ae0694a9ae6561afa2da568a0768')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
