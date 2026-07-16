# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.235.0.3
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
sha256sums=('b9a079616882318ebac4d4ac9d9aac7df7ec4ac8e3695e3ecb0418b3e8a84722')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
