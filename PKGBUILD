# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.001
pkgrel=2
pkgdesc='Adobe Source Han Sans - Classic Style Chinese Character'
arch=('any')
url='https://github.com/redchenjs/source-han-sans-classic/'
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-sans-classic.git'
)
md5sums=(
    'SKIP'
)

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/adobe-source-han-sans/
    install -Dm 644 ${srcdir}/source-han-sans-classic/*.otf \
                    ${pkgdir}/usr/share/fonts/adobe-source-han-sans/
}
