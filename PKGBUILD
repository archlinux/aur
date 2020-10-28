# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=aws-es-proxy-bin
pkgver=1.2
pkgrel=1
pkgdesc="aws-es-proxy is a small proxy server for signing your requests using latest AWS Signature Version 4 when connecting to AWS ElasticSearch"
arch=('x86_64')
url="https://github.com/abutaha/aws-es-proxy"
license=('MPL2')

source=("aws-es-proxy-${pkgver}::${url}/releases/download/v${pkgver}/aws-es-proxy-${pkgver}-linux-amd64")
sha256sums=('6e8723d69cf531c314e3a4bdf2f8fcf9f9f99b27b57c3a053c43b1c6d1a1d061')

package() {
	install -D -g root -m 0755 -o root "$srcdir/aws-es-proxy-${pkgver}" "$pkgdir/usr/bin/aws-es-proxy"
}
