# Maintainer: artist for Xlibre

pkgname=xlibre-input-synaptics-bin
_pkgname=xlibre-xf86-input-synaptics
pkgver=1.10.0.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Synaptics driver for notebook touchpads (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libxtst' 'libevdev' 'libx11' 'libxi' 'glibc')
provides=('xf86-input-synaptics' 'xlibre-input-synaptics' 'synaptics')
conflicts=('xf86-input-synaptics' 'xlibre-input-synaptics' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27' 'synaptics')
replaces=('synaptics')

sha256sums=('70ab6c2d3c7092e3789bf152fd7f0d9b373babe05178dd29d7b550fb27845213')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

