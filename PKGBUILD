# Maintainer: artist for Xlibre

pkgname=xlibre-input-elographics-bin
_pkgname=xlibre-xf86-input-elographics
pkgver=1.4.4.2
pkgrel=1.2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Elographics TouchScreen input driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-input-elographics-1.4.4.2-1.2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=('xf86-input-elographics' 'xlibre-input-elographics')
conflicts=('xf86-input-elographics' 'xlibre-input-elographics')

sha256sums=('8996da3d95d97d4ad25ad200e7d908b8fe55d49aaaa8bf550abb6dbb0f121a8e')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

