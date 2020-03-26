# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=reem-kufi
_pname=ReemKufi
pkgbase=$_fname-font
pkgname=(otf-$_fname ttf-$_fname)
pkgver=0.8
pkgrel=1
pkgdesc='A Kufic typeface based on early Kific modeles retrofitted to the Fatimid Kufic grid'
arch=('any')
url="https://github.com/alif-type/$_fname"
license=('AGPL3')
provides=("$pkgbase")
makedepends=('fontforge')
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/$_pname-$pkgver.zip")
sha256sums=('a0a1ef1c5a551615d4ca06ff13b461ad311518f70d681aa8035544a84100e36a')

package_otf-reem-kufi() {
  cd "$_pname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
  install -Dm644 -t "$pkgdir/usr/share/license/$pkgname/" OFL.txt
}

package_ttf-reem-kufi() {
  cd "$_pname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" ttf/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
  install -Dm644 -t "$pkgdir/usr/share/license/$pkgname/" OFL.txt
}
