pkgname=paru-wrapper
pkgver=1.0.0
pkgrel=4
pkgdesc="A wrapper around paru that implements dependency-aware orphan cleaning and automatic local repository DB updates"
arch=('any')
url="https://github.com/Vikyek/paru-wrapper"
license=('GPL')
depends=('paru' 'bash' 'sudo')
install=paru-wrapper.install
source=(
    "paru-wrapper"
    "update_mkvpkg_aur.py"
)
sha256sums=('b677fa3cbf8acebd428bc7de21c53b2d7f0cdc568c50006d45e4f2373c30a2a9'
            'a83f6524575cc1ed34e5fa9aabfbb0279cffe67f7c4c7ee098f06b23eb982479')

package() {
    # Install paru wrapper
    install -Dm755 "${srcdir}/paru-wrapper" "${pkgdir}/usr/bin/paru-wrapper"
    install -Dm755 "${srcdir}/update_mkvpkg_aur.py" "${pkgdir}/usr/bin/update_mkvpkg_aur.py"
}
