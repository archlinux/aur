# Maintainer: kylon  < klnix [at] tuta [dt] io >
pkgname='mkchrootb'
pkgver=1.0
pkgrel=2
pkgdesc='chroot-only AUR helper written in bash'
url='https://github.com/kylon/mkchrootb'
arch=('any')
sha256sums=('300c2d5f9171e26154827240ddc9ecc7cc6244d37f477ecd8daa371b70e89f64')
license=('GPL-3.0-or-later')
source=('https://raw.githubusercontent.com/kylon/mkchrootb/5ab06679a0a74e6cc31e2142a55560e671a6a8f3/mkchrootb')
depends=('jq')
optdepends=('tig' 'vifm' 'nano' 'vi')

package() {
    install -Dm755 "${srcdir}/mkchrootb" "${pkgdir}/usr/local/bin/${pkgname}"
}
