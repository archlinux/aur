# Maintainer: shurizzle <shura1991@gmail.com>

pkgname=otf-commit-mono
pkgver=1.137
pkgrel=1
pkgdesc="An anonymous and neutral programming typeface focused on creating a better reading experience."
arch=(any)
url='https://commitmono.com/'
license=('custom:SIL Open Font License v1.1')
source=("commit-mono.zip::https://github.com/eigilnikolajsen/commit-mono/releases/download/${pkgver}/CommitMono-${pkgver}.zip")
sha256sums=('6d147099f47fb19b1b96ddc1072021355637944ce51527a4221706674936e375')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/OTF"
  install -m 644 CommitMono-1.137/CommitMono-400-Regular.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-400-Regular.otf"
  install -m 644 CommitMono-1.137/CommitMono-400-Italic.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-400-Italic.otf"
  install -m 644 CommitMono-1.137/CommitMono-700-Regular.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-700-Regular.otf"
  install -m 644 CommitMono-1.137/CommitMono-700-Italic.otf "${pkgdir}/usr/share/fonts/OTF/CommitMono-700-Italic.otf"
  install -Dm644 CommitMono-1.137/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
