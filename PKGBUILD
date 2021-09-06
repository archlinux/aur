# Maintainer: Patrick Drechsler <socialcoding at pdrechsler dot de>

pkgname=mobsh-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Fast git handover with mob"
arch=('x86_64')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=("git")
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
provides=('mobsh')
conflicts=('mobsh' 'mob')

source_x86_64=("$url/releases/download/v${pkgver}/mob_v${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=("062f581e23165a50914a6407dbcd31dd")

package() {
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}
