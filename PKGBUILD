# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.0.2
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with musl'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.musl::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-musl")

license=('Apache-2.0')

arch=('x86_64')

sha256sums=('5506b533a279d848403e7001239748cb0633e9e32a84e5e08b7ab3700ec3772c')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.musl" "${pkgdir}/usr/bin/scalafmt"
}

