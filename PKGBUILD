# Maintainer: winlu <derwinlu@gmail.com>

pkgname=camel-k-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Apache Camel K (a.k.a. Kamel) is a lightweight integration framework built from Apache Camel that runs natively on Kubernetes and is specifically designed for serverless and microservice architectures."
url="https://github.com/apache/camel-k"
license=('Apache 2.0')
arch=('x86_64')

source_x86_64=("https://github.com/apache/camel-k/releases/download/${pkgver}/camel-k-client-${pkgver}-linux-64bit.tar.gz")
sha256sums_x86_64=('7137a12c206be640268f564ff834fd1ffecace461954ae88cf357b420f52ebce')


package() {
    install -Dm755 "$srcdir/kamel" "$pkgdir/usr/bin/kamel"
}
