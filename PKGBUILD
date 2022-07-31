# Maintainer: Denys Rybalka <(first name).(second name)@tuta.io>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# Contributor: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=scalafmt-native-bin
pkgver=3.5.8
pkgrel=1
pkgdesc='Code formatter for Scala, native version via graalvm, statically compiled with musl'
url='https://scalameta.org/scalafmt/'
source=("${pkgname}-${pkgver}.musl::https://github.com/scalameta/scalafmt/releases/download/v${pkgver}/scalafmt-linux-musl")

license=('Apache-2.0')

arch=('x86_64')

b2sums=('d4ccbb79eb787300fd8686d52084cdd9a0f8442856f3db2950200d08f452ff17d6c780feaf16329a514323b1cd4b918b07d44955fcc9c6b005bc276f9a06d36a')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}.musl" "${pkgdir}/usr/bin/scalafmt"
}
