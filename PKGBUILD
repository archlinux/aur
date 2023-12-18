# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=ttf-google-sans
pkgver=1
pkgrel=4

pkgdesc="Google's signature family of fonts"
url='https://flutter.googlesource.com/gallery-assets'
arch=('any')

makedepends=('git')

source=('git+https://flutter.googlesource.com/gallery-assets')
md5sums=('SKIP')

package() {
  install -Dm644 "${srcdir}/gallery-assets/lib/fonts/GoogleSans"*".ttf" -t "${pkgdir}/usr/share/fonts/TTF"
}
