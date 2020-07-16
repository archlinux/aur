# Maintainer:  nissen22

# You need to manually download the .deb file and place it where this
#  PKGBUILD is located, since FossHub does not allow static linking.
# `https://www.fosshub.com/CudaText.html?dwl=cudatext_1.106.6.1-1_gtk2_amd64.deb`

pkgname=cudatext-gtk2-bin
pkgver=1.107.0.0
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
sha256sums=('fbe323934f79717a4452d2ef2baf40bc31722f96963c4a96caee2091c097cdbc')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
