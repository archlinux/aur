# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=woterm
_pkgname=woterm
pkgver=9.26.3
pkgrel=1
pkgdesc="支持SSH/SFTP/RLOGIN/TELNET/SERIALlPORT/VNC/RDP的跨平台远程管理工具"
arch=("x86_64")
url="https://github.com/aoyiduo/woterm/"
license=('GPL 3.0')
#makedepends=("imagemagick")
source=("${_pkgname}.tar.gz::https://github.com/aoyiduo/woterm/releases/download/v${pkgver}/woterm-linux-x86_64-v${pkgver}-202301262039.tar.gz"
  	"${_pkgname}.desktop")
sha256sums=("e65371e466fc070c6877ae025a3a0537611ae41c1eef301541466dfbf988b14a"
	   "d36005e302f489f0b04e9f391fc1ed7b32fbf1d4315f397e9abc5fee18555cc7" )


package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/opt/${_pkgname}
  cp -Rv  woterm-linux-x86_64-v9.26.3-202301262039/* ${pkgdir}/opt/${_pkgname}
  install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  
}

