# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.4.0
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with musl'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.musl::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-musl")

license=('Apache-2.0')

arch=('x86_64')

b2sums=('2986ab6d15eb1b04663a0f91ad74db6e59819dabe2ef5c88e86a26b7e2af44601c8cbc00df82536405db00a8801911582155c478014d6b28ffd006b2bec48e9f')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.musl" "${pkgdir}/usr/bin/scalafmt"
}
