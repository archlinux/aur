# Maintainer: Harpreet Singh <wise.pin7797 at fastmail.com>
# Contributor: Denys Rybalka <(first name).(second name)@tuta.io>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# Contributor: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.11.5
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.glibc::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-glibc")

license=('Apache-2.0')
depends=('glibc')

arch=('x86_64')
sha256sums=('4a29c3651f64fbaf9adcca01c6ac2ba0e8281a3d20e08c12b152582139fae290')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.glibc" "${pkgdir}/usr/bin/scalafmt"
}
