# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=woterm
_pkgname=woterm
pkgver=9.27.1
pkgrel=1
pkgdesc="支持SSH/SFTP/RLOGIN/TELNET/SERIALlPORT/VNC/RDP的跨平台远程管理工具"
arch=("x86_64")
url="https://github.com/aoyiduo/woterm/"
license=('GPL 3.0')
#makedepends=("imagemagick")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aoyiduo/woterm/releases/download/v${pkgver}/woterm-linux-x86_64-v${pkgver}-202305140844.tar.gz"
  	"${_pkgname}.desktop")
sha256sums=("ffd1bddedeb320e03831aa94a0f944e6949911c10a8888ebf73ebdfa460c94e8"
	   "d36005e302f489f0b04e9f391fc1ed7b32fbf1d4315f397e9abc5fee18555cc7" )


package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/opt/${_pkgname}
  cp -Rv  woterm-linux-x86_64-v9.27.1-202305140844/* ${pkgdir}/opt/${_pkgname}
  install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  
}


