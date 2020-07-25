# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_pkgname=gentium-basic
pkgname=ttf-$_pkgname
pkgver=1.1
_pkgver=110
pkgrel=5
pkgdesc='Fonts based on the original Gentium design with additional weights'
arch=('any')
url="https://scripts.sil.org/Gentium_basic"
license=('OFL')
source=("${pkgname}-${pkgver}.zip::https://scripts.sil.org/cms/scripts/render_download.php?site_id=nrsi&format=file&media_id=GentiumBasic_${_pkgver}&filename=GentiumBasic_${_pkgver}.zip")
sha256sums=('7f03ab68349253e520a3e716069bd8d628381f7b8001b3d984e85ac4da75a035')
package() {
  cd "Gentium Basic $pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
