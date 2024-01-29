# Maintainer: vcalv

pkgname=ttf-topaz
pkgver=1.0
pkgrel=1
pkgdesc="Amiga 500 Topaz font updated for the 21st century"
arch=('any')
url="https://gitlab.com/Screwtapello/topaz-unicode"
license=(custom)
depends=()
conflicts=()
source=("https://gitlab.com/Screwtapello/topaz-unicode/-/jobs/6036905109/artifacts/download")
sha512sums=('8ab867faa3f21f806c0657550f04d5f2bc6ddfa7ad6a5776690a1f24bd36d6008a1b876349632287110645811742be163880b38686b2d91df2ade07f3af2d16a')


build() {
	cd ${srcdir}/${_pkgname}
	#gzip -9 -k -v topaz_unicode_ks13-16.psf
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  #install -Dm644 -t "$pkgdir//usr/share/kbd/consolefonts/" *.psf*
}


