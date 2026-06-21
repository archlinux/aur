# Maintainer: Rocket Aaron <rocka@archlinuxcn.org>

pkgname=ttf-noto-vf
pkgdesc='Google Noto font (Variable weight and width, TTF)'
pkgver=2026.06.01
pkgrel=1
provides=(ttf-font noto-fonts noto-fonts-extra)
arch=(any)
url='https://fonts.google.com/noto'
license=('OFL-1.1')
source=(https://github.com/notofonts/notofonts.github.io/archive/refs/tags/noto-monthly-release-${pkgver}.tar.gz)
b2sums=('37b8953291f6a472e7006e576fad99d2a476f6bc55af70296057f39cd6f1c179cf54325b82af2d8bbe2be8dc0fa2b2e9d953a9ed66b8358c8a65f52548efb355')

package() {
  cd "notofonts.github.io-noto-monthly-release-${pkgver}"

  install -Dm644 fonts/NotoSans/full/variable-ttf/NotoSans[wdth,wght].ttf "${pkgdir}/usr/share/fonts/noto/NotoSans-VF.ttf"
  install -Dm644 fonts/NotoSans/full/variable-ttf/NotoSans-Italic[wdth,wght].ttf "${pkgdir}/usr/share/fonts/noto/NotoSans-Italic-VF.ttf"
  install -Dm644 fonts/NotoSerif/unhinted/variable-ttf/NotoSerif[wdth,wght].ttf "${pkgdir}/usr/share/fonts/noto/NotoSerif-VF.ttf"
  install -Dm644 fonts/NotoSansMono/unhinted/variable-ttf/NotoSansMono[wdth,wght].ttf "${pkgdir}/usr/share/fonts/noto/NotoSansMono-VF.ttf"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
