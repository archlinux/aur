# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

# You need to manually download the .deb file and place it where this
#  PKGBUILD is located, since FossHub does not allow static linking.
# `https://www.fosshub.com/CudaText.html?dwl=cudatext_1.105.5.5-1_gtk2_amd64.deb`

pkgname=cudatext-gtk2-bin
pkgver=1.105.5
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
options=('!strip')
source=("local://${pkgname%-gtk2-bin}_${pkgver}.5-1_gtk2_amd64.deb")
sha256sums=('da82396e8700f2425b7eb73a1be0df4ed17d3309960c0c3d7a4e8b057a2d2a33')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
