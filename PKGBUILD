# Maintainer: Estela <i at estela dot moe>

_name=atkinson-hyperlegible-next
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable 
otf-$_name-mono ttf-$_name-mono ttf-$_name-mono-variable)
pkgver=1.00
_hash=7925f50f649b3813257faf2f4c0b381011f434f1
_hash_mono=154d50362016cc3e873eb21d242cd0772384c8f9
pkgrel=2
pkgdesc='New version of the Atkinson Hyperlegible fonts - A typeface focusing on leterform distinction for legibility for low vision readers'
arch=(any)
url=https://www.brailleinstitute.org/freefont
_url="https://github.com/googlefonts/$_name"
license=(OFL)
source=("https://github.com/googlefonts/$_name/archive/$_hash.tar.gz"
  "https://github.com/googlefonts/$_name-mono/archive/$_hash_mono.tar.gz")
sha256sums=('4b455dcf5ce2d6261df7caf6f4d035c893b446f14269106a07bc03c204368626'
            'd8b50ca876781ef6c2f0e1dd1a7ed6896a7f7769242e76be901b98c6d7edfafb')

package_otf-atkinson-hyperlegible-next() {
  cd "$srcdir/$_name-$_hash"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-atkinson-hyperlegible-next() {
  cd "$srcdir/$_name-$_hash"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/ttf/*.ttf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-atkinson-hyperlegible-next-variable() {
  cd "$srcdir/$_name-$_hash"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/variable/*.ttf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_otf-atkinson-hyperlegible-next-mono() {
  cd "$srcdir/$_name-mono-$_hash_mono"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-atkinson-hyperlegible-next-mono() {
  cd "$srcdir/$_name-mono-$_hash_mono"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/ttf/*.ttf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-atkinson-hyperlegible-next-mono-variable() {
  cd "$srcdir/$_name-mono-$_hash_mono"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/variable/*.ttf
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
