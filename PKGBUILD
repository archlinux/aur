# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with musl'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.musl::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-musl")

license=('Apache-2.0')

arch=('x86_64')

sha256sums=('704470d0d49f57956f507c4274bd35e9132c6a8896e5c43214c5da10fac8da6d')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.musl" "${pkgdir}/usr/bin/scalafmt"
}

