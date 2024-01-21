# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=commit-mono-font
pkgname=(otf-commit-mono ttf-commit-mono)
pkgver=1.143
pkgrel=2
pkgdesc="An anonymous and neutral programming font focused on creating a better reading experience"
arch=('any')
url="https://commitmono.com/"
license=('OFL-1.1')
source=("https://github.com/eigilnikolajsen/commit-mono/releases/download/v${pkgver}/CommitMono-${pkgver}.zip")
sha256sums=('f7d1f26a7c7554800a996f76f5d706bf0648b936ca2a66b5bc4d46e3a2c49ed0')

package_otf-commit-mono() {
  cd "CommitMono-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF/" *.otf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" license.txt
}

package_ttf-commit-mono() {
  cd "CommitMono-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" ttfautohint/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" license.txt
}
