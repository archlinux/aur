# Maintainer: archertech ac@archertech.ru
# Contributor: winlu <derwinlu@gmail.com>

pkgname=camel-k-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Apache Camel K (a.k.a. Kamel) is a lightweight integration framework built from Apache Camel that runs natively on Kubernetes and is specifically designed for serverless and microservice architectures."
url="https://github.com/apache/camel-k"
license=('Apache 2.0')
arch=('x86_64')

source_x86_64=("https://github.com/apache/camel-k/releases/download/v${pkgver}/camel-k-client-${pkgver}-linux-64bit.tar.gz")
sha256sums_x86_64=('0c89c16d4ada98694c2788606b128f1955fece02366896963ae1eb3836feb1e0')


package() {
    install -Dm755 "$srcdir/kamel" "$pkgdir/usr/bin/kamel"
}
