# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony
pkgver=0.4.1
pkgrel=3
pkgdesc="RusTOTPony — CLI manager of one-time password generators like Google Authenticator"
url="https://github.com/zebradil/rustotpony"
arch=(i686 x86_64 armv6h armv7h)
license=(MIT)
groups=()
backup=()
depends=()
depends_i686=()
depends_x86_64=()
depends_armv6h=()
depends_armv7h=()
makedepends=(cargo)
makedepends_i686=()
makedepends_x86_64=()
makedepends_armv6h=()
makedepends_armv7h=()
checkdepends=()
checkdepends_i686=()
checkdepends_x86_64=()
checkdepends_armv6h=()
checkdepends_armv7h=()
optdepends=()
optdepends_i686=()
optdepends_x86_64=()
optdepends_armv6h=()
optdepends_armv7h=()
conflicts=(rustotpony-bin)
conflicts_i686=()
conflicts_x86_64=()
conflicts_armv6h=()
conflicts_armv7h=()
provides=(totp)
provides_i686=()
provides_x86_64=()
provides_armv6h=()
provides_armv7h=()
replaces=()
replaces_i686=()
replaces_x86_64=()
replaces_armv6h=()
replaces_armv7h=()
source=(rustotpony-0.4.1::https://github.com/zebradil/rustotpony/archive/0.4.1.tar.gz)
source_i686=()
source_x86_64=()
source_armv6h=()
source_armv7h=()
sha256sums=(SKIP)
sha256sums_i686=()
sha256sums_x86_64=()
sha256sums_armv6h=()
sha256sums_armv7h=()
build () 
{ 
    cd "${pkgname}-${pkgver}";
    cargo build --release
}
package () 
{ 
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
