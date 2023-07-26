# Maintainer: shurizzle <shura1991@gmail.com>

pkgname=otf-commit-mono
pkgver=1.132
pkgrel=1
pkgdesc="An anonymous and neutral programming typeface focused on creating a better reading experience."
arch=(any)
url='https://commitmono.com/'
license=('custom:SIL Open Font License v1.1')
source=("commit-mono.zip::https://github.com/eigilnikolajsen/commit-mono/releases/download/${pkgver}/CommitMono-${pkgver}.zip")
sha256sums=('572b2c28d4d993ffe7323830fcab521e49a5db79fee1813debe5bdbe2b7cfcdb')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/OTF"
  install -m 644 CommitMono-450-Regular.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-450-Regular.otf"
  install -m 644 CommitMono-450-Italic.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-450-Italic.otf"
  install -m 644 CommitMono-700-Regular.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-700-Regular.otf"
  install -m 644 CommitMono-700-Italic.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-700-Italic.otf"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
