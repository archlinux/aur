# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=gx-go
pkgver=1.6.0
pkgrel=1

pkgdesc="A tool to use with the gx package manager for packages written in go."
url="https://github.com/whyrusleeping/$pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')

depends=('glibc')
optdepends=()
makedepends=()

_srcroot="https://ipfs.io/ipns/dist.ipfs.io"
source_x86_64=("$_srcroot/$pkgname/v$pkgver/${pkgname}_v${pkgver}_linux-amd64.tar.gz")
source_i686=("$_srcroot/$pkgname/v$pkgver/${pkgname}_v${pkgver}_linux-386.tar.gz")
source_armv7h=("$_srcroot/$pkgname/v$pkgver/${pkgname}_v${pkgver}_linux-arm.tar.gz")

sha512sums_i686=('3177e9232a96070d7898cfeb513c445d484a139e184411edf8a633b16e2cf5fbbc3136ea8c4c406367d15b9685e9c5c0789ae59a3758b6881be39a890aed9f3e')
sha512sums_x86_64=('9654000bcfa14193eeb353811c1333064aeb387162c8faa4037147dbdc16db3176d754cc17171b36f5102847823f6da2063573f9cc78dcec0569ec6decc413dc')
sha512sums_armv7h=('8486951b90ac70681c86fa87933633cedf591a0933200dbb2372138005b26b0ddd72954a47290c2efb6ee34978806773898f9bc03d5c5cb1909b341120e74a18')

package() {
  install -Dm 755 ${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
