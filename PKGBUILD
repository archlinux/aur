# Maintainer: Bastian Ruppert <funny0facer@mail.de>

pkgname=adwaita-cursors-not-hidden

pkgver=v1.0.0
pkgrel=1

pkgdesc="visible adwaita cursor theme"
arch=(any)

arch=(any)
url="https://github.com/funny0facer/AdwaitaCursorNotHidden"

license=("CC-BY-SA-3.0 OR LGPL-3.0-only")

source=("https://github.com/funny0facer/AdwaitaCursorNotHidden/releases/download/$pkgver/$pkgname.tar.gz")
b2sums=('1c984758347efbbbc1da3d4195c55b2c231db24e82e0a2ecac4d96334c17a6ca4f1b3cdac1bf04305457739d6a136c7477ab518148173bd908b2a1d322a9438b')

package(){
  mkdir -p "$pkgdir/usr/share/icons"
  mv "$srcdir/AdwaitaNotHidden" "$pkgdir/usr/share/icons"
}
