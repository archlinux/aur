# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-722smc'
pkgver='5.50'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Network Adapter X722 Series for Supermicro® X11 (DPi/DPi-NT)'
arch=('x86_64')
url='https://forum.proxmox.com/threads/supermicro-x11dpi-nt-nic-x722-firmware-nvm-update.121609/'
license=('Custom')
source=("https://s3.e2e4.ru/k0ste/rpm/${pkgname}-${pkgver}.zip")
sha256sums=('312a6c7c7d3efc6aaba6dbf9af8d55ccf88d806609548fddcc5b76847b69d06a')

prepare() {
  chmod +x "${pkgver} DPINT3A1_NUP/nvmupdate64e"
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${pkgver} DPINT3A1_NUP" "${pkgdir}/opt/${pkgname}"
}
