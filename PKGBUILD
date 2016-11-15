# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.6.6
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos Edition'
arch=('any')
#url='https://github.com/Antergos/Numix-Frost'
url='http://numixproject.org/'
license=('GPL3')
groups=('themes' 'themes::gtk')
depends=('gtk-engine-murrine' 'gtk3>=3.18')
replaces=('gtk-theme-numix-frost')
source=(http://mirrors.antergos.com/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('f8b4166282568e2a008bc36548a5e9a8c8cab5c02edae6f59facbf45ee077bfac699239bc942c6908bdf3b0666f188a80b6de213300fa6cbc90c7ed7f676b1f2'
            'SKIP')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D') # Antergos Build Server (Automated Package Build System) <admin@antergos.org>

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
