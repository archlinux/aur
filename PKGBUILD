# Contributor: Vasily Plotnikov daylioti@gmail.com
pkgname=docker-commander
pkgver=1.0.3
pkgrel=1
pkgdesc='Execute commands in docker containers, using simple gui'
depends=('docker')
arch=('x86_64')
url='https://github.com/daylioti/docker-commander'
license=('APACHE')
source=("${url}/releases/download/$pkgver/${pkgname}_linux_amd64"
        'LICENSE')
md5sums=('b482c66f80cec1918a904af559918213'
         '86d3f3a95c324c9479bd8986968f4327')        
package() {
	install -Dm755 "${srcdir}/${pkgname}_linux_amd64" \
        "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}        

