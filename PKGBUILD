# Maintainer: attenuation <ouyangjun1999@gmail.com>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
pkgver=7.6.3.0.86415
pkgrel=1
pkgdesc="Support access to ssl vpn. With easyconect，you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('custom')
install=${pkgname}.install
source=("http://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_01/EasyConnect_x64.deb")
md5sums=('6ed6273f7754454f19835a456ee263e3')
package(){
	tar xzf data.tar.gz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/share/sangfor/EasyConnect/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
