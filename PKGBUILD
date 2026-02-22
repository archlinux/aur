# Maintainer: artist for Xlibre

pkgname=xlibre-input-void-bin
_pkgname=xlibre-xf86-input-void
pkgver=1.4.2.3
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org void input driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('custom')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-input-void-1.4.2.3-1-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-input-void' 'xlibre-input-void')
conflicts=('xf86-input-void' 'xlibre-input-void' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('5280f420839c4854d0ef97a96898887663ebf416d761d46a9a956e976de3113c')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

