# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=scalafmt-native-bin
pkgver=2.3.2
pkgrel=1
pkgdesc='Code formatter for Scala'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.zip::https://github.com/scalameta/scalafmt/releases/download/v$pkgver/scalafmt-linux.zip")
license=('Apache-2.0')

# I'm not actually sure which architectures are supported.
# Please write if the binary won't work.
arch=('any')

depends=('java-runtime')

sha256sums=('a0c0a57543a21243e38bde648e83fb3833ffd55fe8c056d8e8b7b5ab1724fa43')

package() {
  cd "$srcdir"
  install -Dm755 scalafmt-linux/scalafmt "${pkgdir}/usr/bin/scalafmt"
}

