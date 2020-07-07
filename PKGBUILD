# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

# You need to manually download the .deb file and place it where this
#  PKGBUILD is located, since FossHub does not allow static linking.
# `https://www.fosshub.com/CudaText.html?dwl=cudatext_1.106.6.1-1_gtk2_amd64.deb`

pkgname=cudatext-gtk2-bin
pkgver=1.106.6
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
options=('!strip')
source=("local://${pkgname%-gtk2-bin}_${pkgver}.1-1_gtk2_amd64.deb")
sha256sums=('05248f991673e45d90b678da5e17dcd8191bbcf11a987bbe6b12b7b81caf94cf')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
