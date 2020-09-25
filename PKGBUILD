# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=gnome-shell-extension-fixed-ime-list
pkgver=1
pkgrel=1
pkgdesc="Make the IME list in fixed sequence instead of MRU."
arch=('any')
url="https://github.com/AlynxZhou/gnome-shell-extension-fixed-ime-list"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7b46be680812507fc2f8595e88625752d62906a9767578411f09bdddef350620a593c58e7cb59ed7a9e525c77a5692a02b015f3a22465b1c0d3d8e640aef3bf5')

package() {
    _uuid="fixedimelist@alynx.one"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

