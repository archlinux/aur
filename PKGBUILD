# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.6.3
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

sha256sums=('c4d42bfddea3a65a3099ba1f9787af5f9995633512750d661d51b737b6ebdf30')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

