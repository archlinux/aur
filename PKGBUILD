# Maintainer: Romain Gautier <romain dot gautier at nimamoh dot com>
pkgname=kotlinc
pkgver=1.0.1_2
pkgrel=1
epoch=1459165560
pkgdesc="Kotlin compiler"
arch=('any')
url="https://github.com/JetBrains/kotlin/releases/tag/1.0.1-2"
license=('apache')
groups=()
depends=('java-environment>=6' 'bash')

source=("https://github.com/JetBrains/kotlin/releases/download/1.0.1-2/kotlin-compiler-1.0.1-2.zip")
sha256sums=("07499b67b272348bae66bd075c872f8247ed22115171dd216371407cd6dcae4d")

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -R "${srcdir}/kotlinc/"* "${pkgdir}/opt/${pkgname}"

  ln -s "/opt/kotlinc/bin/kotlinc" "${pkgdir}/usr/bin"
  ln -s "/opt/kotlinc/bin/kotlinc-jvm" "${pkgdir}/usr/bin"
  ln -s "/opt/kotlinc/bin/kotlinc-js" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:&
