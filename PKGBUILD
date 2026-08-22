# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.236.0.4
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
sha256sums=('7385a9f267a5dd75c0ddd6f597ab3c409a1c8a43fa9fba8b9917d43e5b26dba4')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
