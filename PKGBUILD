# Maintainer: nico <nico@example.com>
pkgname=memoa-bin
pkgver=0.1.375
pkgrel=1
pkgdesc="The best for Markdown Editing"
arch=('aarch64')
url="https://example.com/memoa"
license=('unknown')
depends=('gtk3' 'webkit2gtk' 'openssl')
provides=('memoa')
conflicts=('memoa')
options=('!strip')
source=("https://repository.hellonico.info/repository/arch/memoa/${pkgver}/memoa_aarch64"
        "memoa.png"
        "memoa.desktop")
sha256sums=('58e70e90a5e08a623d920e6614b38d66e1970b270a77b1ecd605d97628f01ac6'
            '72efe0d27e0fb81dd20b151c240ce99dddea08afcb1c6b2deb7556ed2b2690e5'
            '8bbe11862d09b4d2fa9820b530c16ac6681e52bfe64fb3d8e20cebc9bdb8c2a2')

package() {
  install -Dm755 "${srcdir}/memoa_aarch64" "${pkgdir}/usr/bin/memoa"
  install -Dm644 "${srcdir}/memoa.png" "${pkgdir}/usr/share/pixmaps/memoa.png"
  install -Dm644 "${srcdir}/memoa.desktop" "${pkgdir}/usr/share/applications/memoa.desktop"
}
