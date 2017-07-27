# Maintainer: Len Zhang <zyldragoon@gmail.com>

pkgname=noto-fonts-cjk-otf
pkgver=20170601
_commit=32a5844539f2e348ed36b44e990f9b06d7fb89fe
pkgrel=3
pkgdesc="Google Noto CJK fonts, use OTF type to solve some font fallback problems"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
conflicts=('noto-fonts-cjk')
install=$pkgname.install
source=("https://github.com/googlei18n/noto-cjk/archive/$_commit.zip")
sha256sums=('31e53af3f5e97ae021f24f960608e98f64aaa12804eda7fb583dcfaa8d496ebf')

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/OTF/noto-cjk
  install -m644 noto-cjk-$_commit/*.otf "$pkgdir"/usr/share/fonts/OTF/noto-cjk
  install -Dm644 noto-cjk-$_commit/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
