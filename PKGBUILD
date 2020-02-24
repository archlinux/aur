# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.4.2
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

sha256sums=('8d7363b7e8d45a67f172580756a9cb26aec63b57cc583e263ceb25c784e8534e')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt-linux/scalafmt "${pkgdir}/usr/bin/scalafmt"
}

