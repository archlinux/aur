# Maintainer: Hugo Sales <hugo (at) fc (dot) up (dot) pt>

pkgname=pandoc-latex-fontsize
pkgrel=2
pkgver=1.1.2
pkgdesc="Pandoc filter for changing fontsize in code blocks"
url="https://github.com/chdemko/${pkgname}"
license=("BSD")
arch=('x86_64')
provides=("$pkgname")
depends=('python' 'python-pypandoc' 'python-panflute')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chdemko/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0f8d41b6d449f96f6a73593d3f76ef45180dca2244d374d7f4c5301337247ef6d3b8459683949403819a7b6f93247d2db37868bf5fbe59542899b95a10710562')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    install -Dm755 "${pkgname//-/_}.py" "${pkgdir}/usr/bin/${pkgname}"
}
