# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.227.0.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('gtk2'
         'python')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext_${pkgver}-${pkgrel}_gtk2_amd64.deb")
sha256sums=('01cff26e621cc1b267f9784a0fb9bb079a325e213abe103a9dbfbfa30d38b4e5')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
