# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.6.2
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

sha256sums=('fe086a0c6b70a81634b26d1e11c92ea2c4ddbec2161b6f1e0d8dab93cb3c96ca')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

