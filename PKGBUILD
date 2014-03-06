# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=ttf-openwebicons
pkgver=1.2.0
pkgrel=1
pkgdesc='Set of icons to show the support for the Open Web'
url='http://pfefferle.github.io/openwebicons/'
license=('custom')
arch=('any')
source=(${pkgname}-${pkgver}::"https://github.com/pfefferle/openwebicons/archive/${pkgver}.tar.gz"
        'install')
install=install

package() {
        cd "${srcdir}/openwebicons-${pkgver}"
        install -dm755 "${pkgdir}"/usr/share/fonts/TTF
        install -m644 source/openwebicons.ttf "${pkgdir}"/usr/share/fonts/TTF

        install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
sha256sums=('0e77e2e511d0642a99396287a7c9ebda3f95f798cc7e0f3ddcf6f1e78b676c8c'
            'a794e8e9f8f8227e6b70ba42b96efe81651856b9e1b335c3094318844af06b45')
