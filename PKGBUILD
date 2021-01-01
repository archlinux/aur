# Maintainer: Bangduo Chen <1413563527@qq.com>
# Contributor: Bangduo Chen <1413563527@qq.com>
pkgname=hillstone-vpn
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="The Hillstone Secure Connect VPN client for Linux. "
arch=(x86_64)
url="http://docs.hillstonenet.com/en/Content/7_VPN/SSL_VPN_Client_L.htm#"
license=('unknown')
changelog=
source=("https://github.com/JackMoriarty/HillstoneVPN/releases/download/v1.0.0/HillstoneVPN-$pkgver.tar.gz")
md5sums=('bb0301e31bdaf7c6bcbafae8e74cd3d6')

package() {
	tar -zxvf "HillstoneVPN-$pkgver.tar.gz" -C "${srcdir}"
	
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/HillstoneVPN" "${pkgdir}/opt"
	
	install -d "${pkgdir}/usr/share/applications"
	install -Dm755 "${srcdir}/HillstoneVPN/HillstoneVPN.desktop" "${pkgdir}/usr/share/applications"
}
