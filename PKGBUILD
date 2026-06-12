# Maintainer: Patrick Li <aur@patrickli.one>
pkgname=unbill-daemon-nightly-bin
pkgver=nightly.20260612.024929
pkgrel=1
pkgdesc="Background daemon for unbill (nightly)"
arch=('x86_64')
url="https://github.com/unbill-project/unbill"
license=('MIT' 'Apache-2.0')
provides=('unbill-daemon' 'unbill-daemon-nightly')
conflicts=('unbill-daemon' 'unbill-daemon-bin')
_tag=nightly-20260612-024929
source_x86_64=("unbill-daemon::https://github.com/unbill-project/unbill/releases/download/${_tag}/unbill-daemon-linux-x86_64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/unbill-daemon" "${pkgdir}/usr/bin/unbill-daemon"
}
