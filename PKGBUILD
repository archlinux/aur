# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=terminal-headers
pkgver=1.0.4
pkgrel=1
pkgdesc='Scripts provide colorful terminal headers, meant to be placed in your shells rc file'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(python-lolcat figlet figlet-fonts-extra)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'ccbca5d3c4f520c19f5bc62f87add882638fcb5d0e6d21b2c2d1feb18a0363b58b4cc4f3eac17ec8f60a04b16e4541168a53aa4b19e8f4487282e58b780578a1'
  '3adb83ee7910868a3f1301b87571226949d53bea882680824f629c69393949a9fecfa22374e7a352a3e3d9d460c46add4af5244ceaa8eca357655c035b0b05eb'
  )
md5sums=(
  'b1bf20c024615f9eb47a35ac78420c54'
  '152a9d6cf4d8fbc8ffef400a1e2e777d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
