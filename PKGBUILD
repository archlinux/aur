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

source=('https://flutter.googlesource.com/gallery-assets/+archive/refs/heads/master/lib/fonts.tar.gz')
md5sums=('SKIP')

package() {
  install -Dm644 "${srcdir}/GoogleSans"*".ttf" -t "${pkgdir}/usr/share/fonts/TTF"
}
