# Maintainer: Ninad Chandorkar <ninad@chandorkartechnologies.com>
pkgname='vikasit-bin'
pkgver=2.2.3
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Vikasit-AI/vikasit-code'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('vikasit')
conflicts=('vikasit')
depends=('ripgrep')
options=('!debug' '!strip')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Vikasit-AI/releases/releases/download/v${pkgver}/vikasit-code-linux-arm64.tar.gz")
sha256sums_aarch64=('64fc21a20806351494f799210a5a87ab562b487d610f7412117ac582f6de6413')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Vikasit-AI/releases/releases/download/v${pkgver}/vikasit-code-linux-x64.tar.gz")
sha256sums_x86_64=('cd91a6050a83876d23e15881077a30e1de579a48563fa75dc9379f1b455799ce')

package() {
  install -Dm755 ./vikasit "${pkgdir}/usr/bin/vikasit"
}
