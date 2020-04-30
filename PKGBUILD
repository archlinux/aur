# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

sha256sums=('5e88fa2d4db2cd9b03a2e536b2df5ba7f5fe2b83e622615095f3f6c097742036')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

