# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=sswb-git
_pkgname=sswb
pkgver=r17.ad20b14
pkgrel=1
pkgdesc="Stupid simple Web Browser - a simply gtk webkit browser"
arch=('any')
url="https://github.com/BlackCodec/sswb"
license=('GPL')
depends=('webkit2gtk' 'python-gobject')
source=("git+https://github.com/BlackCodec/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   install -Dm 755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

