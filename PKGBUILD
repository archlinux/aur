# Maintainer: artist for Xlibre

pkgname=xlibre-input-synaptics-bin
_pkgname=xlibre-xf86-input-synaptics
pkgver=1.10.0.2
pkgrel=1.2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Synaptics driver for notebook touchpads (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-input-synaptics-1.10.0.2-1.2-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libxtst' 'libevdev' 'libx11' 'libxi' 'glibc')
provides=('xf86-input-synaptics' 'xlibre-input-synaptics' 'synaptics')
conflicts=('xf86-input-synaptics' 'xlibre-input-synaptics' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27' 'synaptics')
replaces=('synaptics')

sha256sums=('0b5cb666c0fc773478fa77496e70d1fc19d1c5ec2ee806d28de0a05acd308aec')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

