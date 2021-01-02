# Maintainer: Tim Hellhake

pkgname=akkasls
pkgver=0.1.9
pkgrel=1
pkgdesc='The Akka Serverless CLI'
arch=('x86_64')
url='https://developer.lightbend.com/docs/akka-serverless/index.html'
license=('Commercial')
source=("https://downloads.akkaserverless.com/${pkgver}/akkasls_linux_amd64_${pkgver}.tar.gz")
sha256sums=('22a972e9a133d39303a53048e419108880e9b40ae159cab1a8fbfac4b859eccc')

package() {
  install -Dm 755 -t "${pkgdir}/usr/local/bin" akkasls
}
