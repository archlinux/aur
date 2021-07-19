# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=ttf-gentium-basic
pkgver=1.102
pkgrel=2
pkgdesc='Fonts based on the original Gentium design with additional weights'
arch=(any)
url="https://software.sil.org/gentium/download/previous-versions/"
license=(OFL)
_distdir="GentiumBasic_${pkgver/./}"
source=("https://software.sil.org/downloads/r/gentium/$_distdir.zip")
sha256sums=('2f1a2c5491d7305dffd3520c6375d2f3e14931ee35c6d8ae1e8f098bf1a7b3cc')

package() {
  cd "$_distdir"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
