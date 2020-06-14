# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

# You need to manually download the .deb file and place it where this
#  PKGBUILD is located, since FossHub does not allow static linking.
# `https://www.fosshub.com/CudaText.html?dwl=cudatext_1.104.0.0-1_gtk2_amd64.deb`

pkgname=cudatext-gtk2-bin
pkgver=1.104.0
pkgrel=2
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
options=('!strip')
source=("local://${pkgname%-gtk2-bin}_${pkgver}.0-1_gtk2_amd64.deb")
sha256sums=('3c5decfc2714a71299e5acc9569bcefb84f722569adeb6fbe9c38317771fde1b')

package() {
    tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
