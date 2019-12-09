# Packager: Vicente Ferrari <iamvik@pm.me>

pkgname=ttf-aniron
pkgver=1
pkgrel=1
pkgdesc="Aniron is a Lord of the rings font family with 4 styles that was created by Pete Klassen in 2004."
url="https://www.fontspace.com/pete-klassen/aniron"
arch=(any)
license=(custom)
source=("$pkgname-$pkgver.zip::https://www.fontspace.com/download/2247/cda438b3958a41d0b7191b89b8d9f5c7/pete-klassen_aniron.zip")

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
}

md5sums=('d77b9bccc44012c9169103eb69fbcffd')
