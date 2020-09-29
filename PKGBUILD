# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=2.7.3
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with musl'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.musl::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-musl")

license=('Apache-2.0')

arch=('x86_64')

sha256sums=('f04fd9024bf367f74e47e29c46dcd4c398d38298c1e24d847dfeadd16091ec56')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.musl" "${pkgdir}/usr/bin/scalafmt"
}

