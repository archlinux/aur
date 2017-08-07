# Maintainer: Emil Lundberg <emil@emlun.se> (AUR: emlun; GitHub: emlun)

pkgname=intellij-idea-launcher-fix
pkgver=1.0.0
pkgrel=1
pkgdesc='Launcher script for IntelliJ IDEA to make stop button work'
url='https://youtrack.jetbrains.com/issue/IDEA-157989'
arch=('any')
license=('custom:unlicense')
source=('idea.sh' 'UNLICENSE')
sha256sums=('d46c8aad60817fce84d4b5a2957e89412edfe0fde7e267953803ba7314626a98'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')

package() {
  install -Dm 555 "${srcdir}/idea.sh" "${pkgdir}/usr/local/bin/idea.sh"
  install -Dm 444 "${srcdir}/UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
