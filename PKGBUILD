 # Maintainer: yjun <jerrysteve1101@gmail.com>
 pkgname=natapp
 pkgver=2_3_9
 _pkgdate=20191111
 pkgrel=3	
 pkgdesc="Internal Network Penetration Client based on ngrok(Linux Version)"
 arch=("x86_64" "aarch64")
 url="https://natapp.cn"
 license=('unknown')
 depends=()
 source_x86_64=(
	"http://download.natapp.cn/assets/downloads/clients/${pkgver}/${pkgname}_linux_amd64_${pkgver}.zip"
 )
 md5sums_x86_64=('71037d0cf5f038b6cbb84bdcf37d7c30')
 source_aarch64=(
	"http://download.natapp.cn/assets/downloads/clients/${pkgver}/${pkgname}_linux_arm64_${pkgver}.zip"
 )
 md5sums_aarch64=("33e100ca4d57834a551eafb5830c976f")

 package(){
	cd ${srcdir}
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
 }
