# Maintainer: Patrick Drechsler <socialcoding at pdrechsler dot de>

pkgname=mobsh-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Swift git handover with mob"
arch=('x86_64')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=("git")
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
provides=('mobsh')
conflicts=('mobsh' 'mob')

source=("$url/releases/download/v${pkgver}/mob_v${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/remotemobprogramming/mob/master/LICENSE")
md5sums=("32ae7ffd2b8f5705e8242fc9bcf1a553"
        "d449b361903e8abd9b9ee977bfa5d966")

package() {
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}
