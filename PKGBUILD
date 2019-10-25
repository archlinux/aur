# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-mono-classic-fonts
pkgver=1.002
pkgrel=5
pkgdesc='Adobe Source Han Mono - Classic Style Chinese Character'
arch=('any')
url='https://github.com/redchenjs/source-han-mono-classic/'
license=('OFL')
source=(
    'git+https://github.com/redchenjs/source-han-mono-classic.git'
)
md5sums=(
    'SKIP'
)

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/adobe-source-han-sans/
    install -Dm 644 ${srcdir}/source-han-mono-classic/*.otf \
                    ${pkgdir}/usr/share/fonts/adobe-source-han-sans/
}
