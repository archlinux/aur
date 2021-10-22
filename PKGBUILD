# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=aws-es-proxy-bin
pkgver=1.3
pkgrel=1
pkgdesc="aws-es-proxy is a small proxy server for signing your requests using latest AWS Signature Version 4 when connecting to AWS ElasticSearch"
arch=('x86_64')
url="https://github.com/abutaha/aws-es-proxy"
license=('MPL2')

source=("aws-es-proxy-${pkgver}::${url}/releases/download/v${pkgver}/aws-es-proxy-${pkgver}-linux-amd64")
sha256sums=('0eda619592ccffcf41238441ac6c6b0ecfead9ca4ff7a398f15cc6c5d77acf48')

package() {
	install -D -g root -m 0755 -o root "$srcdir/aws-es-proxy-${pkgver}" "$pkgdir/usr/bin/aws-es-proxy"
}
