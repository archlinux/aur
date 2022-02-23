# Maintainer: Xeonacid <h.dwwwwww@gmail.com>
# Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('clashy-bin')
pkgver=0.2.5
pkgrel=1
pkgdesc="A GUI proxy client for Windows / Mac / Ubuntu Desktop based on Clash and Electron. Windows / Mac / Ubuntu 适用的Clash客户端."
provides=("clashy")
url='https://github.com/SpongeNobody/Clashy'
arch=('x86_64')
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret' 'gobject-introspection-runtime' 'ffmpeg')
source=("https://github.com/SpongeNobody/Clashy/releases/download/v${pkgver}/Clashy_${pkgver}_amd64.deb"
)
md5sums=('b4e1e74ce569b90b96303fb972b1f25a')
license=()

package(){
	 cd ${srcdir}
	 tar -xJvf data.tar.xz -C "${pkgdir}"
    
     install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/0x0/apps/clashy.png "${pkgdir}"/usr/share/icons/clashy.png
	 
	 mkdir -p "${pkgdir}"/usr/bin
	 ln -s /opt/Clashy/clashy "${pkgdir}"/usr/bin/clashy
}
