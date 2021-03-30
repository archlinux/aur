# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=ttf-google-sans
pkgver=1
pkgrel=1

pkgdesc="Google's signature family of fonts"
url='https://9to5google.com/2018/05/09/google-sans-vs-product-sans/'
arch=('any')
license=('Apache')

depends=('fontconfig')

source=(Google-Sans-Font.zip::https://ipfs.io/ipfs/QmVtMCggpxEpPPyg8fRUGPgt1ehqSpQpTxyE4HEBhFUMX5)
sha256sums=('3ab39fff78284a4feb362fa0bc4c38517d4473dc7f4b65e72fdd09878768e526')

package() {
  cd Google-Sans-Font/
  install -Dm644 *.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
