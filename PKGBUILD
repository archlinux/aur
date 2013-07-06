# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=ttf-openwebicons
pkgver=1.1.0
pkgrel=1
pkgdesc='a font!'
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

sha256sums=('82d6a519967405a3b2516f296ab82b541b0d114aa6c39a78f6c13a7c8db475ca'
            'a794e8e9f8f8227e6b70ba42b96efe81651856b9e1b335c3094318844af06b45')
