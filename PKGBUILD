# Maintainer:  שזענוי e punkt sovetkin auf gmail punkt com
pkgname=fortune-mod-yiddish
pkgver=20210415
pkgrel=1
pkgdesc="Fortune cookies: yiddish wits."
url="https://www.yiddishwit.com/"
arch=('any')
license=('custom:PublicDomain')
depends=('fortune-mod')
source=('yiddishwits')
sha256sums=('09691145ed876ba2616854f04d943902953e7a2e20591a660e55a76437013272')

build() {
    strfile ${srcdir}/yiddishwits
}

package(){
    install -D -m644 ${srcdir}/yiddishwits ${pkgdir}/usr/share/fortune/yiddishwits
    install -D -m644 ${srcdir}/yiddishwits.dat ${pkgdir}/usr/share/fortune/yiddishwits.dat
}
