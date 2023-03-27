# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-static-musl-bin'
pkgver=1.1.6
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (statically linked to musl, pre-compiled)'
arch=('x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('fuc' 'cpz' 'rmz')
conflicts=('fuc' 'cpz' 'rmz')
source=(
  "cpz-$pkgver::$url/releases/download/$pkgver/cpz-x86_64-unknown-linux-musl"
  "rmz-$pkgver::$url/releases/download/$pkgver/rmz-x86_64-unknown-linux-musl"
)
noextract=(
  "cpz-$pkgver"
  "rmz-$pkgver"
)

package() {
  for exe in cpz rmz; do
    install -Dm0755 "$exe-$pkgver" "$pkgdir/usr/bin/$exe"
  done
}

sha256sums=(
  '731260c179b436ff0c5368dd3878d8f46391ffd58737b3f0530342f4f2e0ab4b'
  'e304450c73b3e35d0f5159b95fdba1f461c61e3b47f7310880f01c0eaf01a96a'
)
sha512sums=(
  '9ce69391894626c9772fe25b2c569174db98b31d17f104b6eded9b526f26dd409c776035789949638c590f761dc4fecb288efb31ab70d9faad0077fab1264662'
  'de79467ddfa52b44ed07b9418a2cede0f59610c931c86642215ac6cc41ae78f001837eaea93be1730665355327d57b57bc10560dc5dad8b8fc2fc40afcc3bf0e'
)
b2sums=(
  '79a42903d839a3094d3a47ebb24a3e14732842f2a6eb598d799eb8d5853e9dcfa3e7036403b8e119c165c9a3eb6584e1ba4e93862065e49ea08c77844b024d91'
  '1e08c05773efb2fb74ae33052203fad8874faa54c03370bed6a96182318158d08048bab22b48a3581a3dcd67fa0fe8250f98c52ecc75ccc49555eebc80490508'
)

# eof
