# Maintainer: Harpreet Singh <wise.pin7797 at fastmail.com>
# Contributor: Denys Rybalka <(first name).(second name)@tuta.io>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# Contributor: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.10.1
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with glibc'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.glibc::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-glibc")

license=('Apache-2.0')

arch=('x86_64')

sha256sums=('98d651a6dd432f1babfa97d7415c0579672d780b97807cbef0959b2ec8f88206')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.glibc" "${pkgdir}/usr/bin/scalafmt"
}
