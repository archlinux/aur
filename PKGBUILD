# Maintainer:  eltonff


pkgname=cudatext-gtk2-bin
pkgver=1.223.5.0
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
sha256sums=('f42e7a39690fcd2bc8daa8e8d4267f3e471966ee4af01538897b5be5c47dba83')

package() {
    tar xvf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
}
