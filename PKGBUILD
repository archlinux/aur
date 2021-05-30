# Maintainer: Tim Hellhake

pkgname=akkasls
pkgver=0.0.33
pkgrel=1
pkgdesc='The Akka Serverless CLI'
arch=('x86_64')
url='https://developer.lightbend.com/docs/akka-serverless/index.html'
license=('Commercial')
source=('https://downloads.akkaserverless.com/stable/akkasls_linux_amd64.tar.gz')
sha256sums=('b64231136c5051b9853b23d0c6d2815315c15ae0a6c52505a81792b0d2d16403')

package() {
  install -Dm 755 -t "${pkgdir}/usr/bin" akkasls
}
