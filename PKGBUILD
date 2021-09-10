# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.0.3
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with musl'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.musl::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-musl")

license=('Apache-2.0')

arch=('x86_64')

sha256sums=('b3ada170b022fcd70c2a269f6a1df6b3520f79fb37db276d938d3bbda12a69ed')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.musl" "${pkgdir}/usr/bin/scalafmt"
}

