# Maintainer: artist for Xlibre

pkgname=xlibre-input-wacom-bin
_pkgname=xlibre-xf86-input-wacom
pkgver=1.2.3.3
pkgrel=4
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Wacom tablet driver (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('GPL-2.0-or-later')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-input-wacom-1.2.3.3-4-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libxi' 'libxinerama' 'libxrandr' 'libx11' 'glibc')
provides=('xf86-input-wacom' 'xlibre-input-wacom')
conflicts=('xf86-input-wacom' 'xlibre-input-wacom' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('da789703eb5cbb7fd0616771e6d864f22a9fc68903dde58d01c608a578caad68')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

