# Maintainer:  nissen22

# You need to manually download the .deb file and place it where this
#  PKGBUILD is located, since FossHub does not allow static linking.
# `https://www.fosshub.com/CudaText.html?dwl=cudatext_1.106.6.1-1_gtk2_amd64.deb`

pkgname=cudatext-gtk2-bin
pkgver=1.107.0.2
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
options=('!strip')
source=("local://${pkgname%-gtk2-bin}_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('d82f4b008c21dda43c14f941f9c33468517ea180f5a11011b4a3edfff8b5155f')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
