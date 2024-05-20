  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
  # Maintainer:  derbetakevin <derbetakevin@outlook.de>
pkgname=extraterm-bin
_pkgname=extratermqt
<<<<<<< HEAD
pkgver=0.77.0
||||||| de506193
pkgver=0.75.0
=======
pkgver=0.76.0
>>>>>>> ba97db33307c982db1ab4d527e34ebd040e63a0f
pkgrel=1
conflicts=("extraterm")
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs" "qt6-svg" "gtk3" "hicolor-icon-theme"
         "gdk-pixbuf2" "at-spi2-core" "cairo" "pango"
          "krb5")
source=("$url/releases/download/v$pkgver/""${_pkgname}_""${pkgver}_amd64.deb")
<<<<<<< HEAD
sha256sums=('804c4c2e40056d8f03cb4b5ad22518d84703bf89a7d655789c565c99dba01137')
||||||| de506193
sha256sums=('3f9e50c7321c57a9efa52890613c252ba617f9203e9163eabcfa21d3da887387')
=======
sha256sums=('898f40b09e08c274141645af1ec7f0d3e949601548cc4c40f724720acb1cf304')
>>>>>>> ba97db33307c982db1ab4d527e34ebd040e63a0f
package() {
  cd "$srcdir"

  tar -xf data.tar.zst
  cp -r usr/ "$pkgdir"
  cp -r opt/ "$pkgdir"

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/"$_pkgname" <<END
#!/usr/bin/bash
/opt/extraterm/extraterm
END

  install -Dm755 "$pkgdir/opt/$_pkgname"/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname"/copyright
}

