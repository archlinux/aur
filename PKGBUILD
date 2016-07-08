# Maintainer: Romain Gautier <romain dot gautier at nimamoh dot com>
pkgname=kotlinc
pkgver=1.0.3
pkgrel=1
epoch=1467213600
pkgdesc="Kotlin compiler"
arch=('any')
url="https://github.com/JetBrains/kotlin/releases/tag/v1.0.3"
license=('apache')
groups=()
depends=('java-environment>=6' 'bash')

source=("https://github.com/JetBrains/kotlin/releases/download/v1.0.3/kotlin-compiler-1.0.3.zip")
sha256sums=("37615f1d63e8500cd33c7f3e60b715263f65189d6d8f25defba78968c896dc97")

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
