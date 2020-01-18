# Contributor: Vasily Plotnikov daylioti@gmail.com
pkgname=docker-commander
pkgver=1.1.8
pkgrel=1
pkgdesc='Execute commands in docker containers, using simple gui'
depends=('docker')
arch=('x86_64')
url='https://github.com/daylioti/docker-commander'
license=('APACHE')
source=("${url}/releases/download/$pkgver/${pkgname}_${pkgver}_linux_amd64.tgz"
        'LICENSE')
md5sums=('60d4a395bd9829d987d06321c2b8fa86'
         '86d3f3a95c324c9479bd8986968f4327')
package() {
	install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}        

