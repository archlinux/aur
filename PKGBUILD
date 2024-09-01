# Maintainer: maoyaotang <292898660@qq.com>

pkgname=otf-noto-full
_pkgname=noto-fonts-otf
pkgver=24.9.1
pkgrel=1
pkgdesc='Noto Fonts for all languages'
arch=('any')
url='https://fonts.google.com/noto'
license=('Apache-2.0')
provides=('Noto')
source=("git+https://gitee.com/mao-yaotang/noto-fonts-otf.git")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  rm -r LICENSE README.md
  install -dm 755 "${pkgdir}/usr/share/fonts/noto"
  cp -r * "${pkgdir}/usr/share/fonts/noto"
}
