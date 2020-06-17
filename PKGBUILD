# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

sha256sums=('68dce78329a6a1d1d6e88f6bb89283696a67c2a0588f19d59ccdee8bb74dae83')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

