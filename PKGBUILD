# Maintainer: kylon  < klnix [at] tuta [dt] io >
pkgname='mkchrootb'
pkgver=1.0
pkgrel=1
pkgdesc='chroot-only AUR helper written in bash'
url='https://github.com/kylon/mkchrootb'
arch=('any')
sha256sums=('d5ca1e848d35213c9a2d413d5949c7448c9af37443de4ab99d39b5ed08fa38c7')
license=('GPL-3.0-or-later')
source=('https://raw.githubusercontent.com/kylon/mkchrootb/c78c768049323352dd784768730b3d10e8d30d04/mkchrootb')
depends=('jq')
optdepends=('tig' 'vifm' 'nano' 'vi')

package() {
    install -Dm755 "${srcdir}/mkchrootb" "${pkgdir}/usr/local/bin/${pkgname}"
}
