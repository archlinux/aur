# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=woterm
_pkgname=woterm
pkgver=9.27.2
pkgrel=1
pkgdesc="支持SSH/SFTP/RLOGIN/TELNET/SERIALlPORT/VNC/RDP的跨平台远程管理工具"
arch=("x86_64")
url="https://github.com/aoyiduo/woterm/"
license=('GPL 3.0')
#makedepends=("imagemagick")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aoyiduo/woterm/releases/download/v${pkgver}/woterm-linux-x86_64-v${pkgver}-202305211102.tar.gz"
  	"${_pkgname}.desktop")
sha256sums=("9d3d96471eb7f8f9bc7f287c05e50b482a4776046872a59051cda337aa4e0273"
	   "d36005e302f489f0b04e9f391fc1ed7b32fbf1d4315f397e9abc5fee18555cc7" )

package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/opt/${_pkgname}
  cp -Rv  woterm-linux-x86_64-v9.27.2-202305211102/* ${pkgdir}/opt/${_pkgname}
  install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  
}


