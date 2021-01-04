# Maintainer: Patrick Drechsler <socialcoding at pdrechsler dot de>

pkgname=mobsh-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="Swift git handover"
arch=('x86_64')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=("git")
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
provides=('mobsh')
conflicts=('mobsh' 'mob')

source_x86_64=("$url/releases/download/v${pkgver}/mob_v${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=("32ae7ffd2b8f5705e8242fc9bcf1a553")
source=("${pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
md5sums=("d449b361903e8abd9b9ee977bfa5d966")

package() {
    install -D -m644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "mob" "$pkgdir/usr/bin/mob"
}
