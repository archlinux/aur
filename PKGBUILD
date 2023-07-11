# Maintainer: GCMarvin <GCMarvin@users.noreply.github.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=ttf-google-sans
pkgver=1
pkgrel=3

pkgdesc="Google's signature family of fonts"
url='https://github.com/mnemotiv/Google-Sans-Fonts'
arch=('any')
license=('Apache')

makedepends=('git')

source=('git+https://github.com/mnemotiv/Google-Sans-Fonts')
md5sums=('SKIP')

package() {
  install -Dm644 "${srcdir}/Google-Sans-Fonts/GoogleSans-"*".ttf" -t "${pkgdir}/usr/share/fonts/TTF"
}
