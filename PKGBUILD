# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.6.1
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

sha256sums=('013cd4e8ca34834c0766b3d6502a435887cc73cefa46322b229c9507f63eac3e')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

