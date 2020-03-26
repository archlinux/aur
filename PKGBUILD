# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=amiri-typewriter
_pname=AmiriTypewriter
pkgbase=$_fname-font
pkgname=(ttf-$_fname)
pkgver=1.1
pkgrel=1
pkgdesc='Mono-width companion to Amiri font family'
arch=('any')
url="https://github.com/alif-type/$_fname"
license=('OFL')
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/$_pname-$pkgver.zip")
sha256sums=('985aa63413f4955f9428aab67021e55023bd040933b7dd434461fe5800f33fab')

package_ttf-amiri-typewriter() {
  cd "$_pname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt *.pdf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
