# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname="vesktop-spoof-pacman-hook"
pkgver=1.0
pkgrel=1
pkgdesc="Adds '--user-agent-os windows' to the desktop file after vesktop updates, for those using VPNs being blocked by Discord's recent Linux VPN bans!"
arch=('any')
url=""
license=('GPL-3.0')
depends=(
    'sed'
)
provides=("${pkgname}=${pkgver}")
source=(
    "vesktop-spoof.hook"
)

package() {
    cd              "${srcdir}"

    install -Dm755  vesktop-spoof.hook  "${pkgdir}/usr/share/libalpm/hooks/vesktop-spoof.hook"
}
b2sums=('3459fd030fa549ecf9d06697d340c9827036c2f1b8192b5ea7f73f7a049b0a1e415bd5c7472f287d1c004d1c65b63134347170475fad2b57d3efe255edfda14a')
sha512sums=('d28b5f216d5ed7c0df28b04f28067a561dde866d533a1451d9ee6a6db4de882d4241617ff4102307b2045d8a30978cf03f8770c81857aff59793e00a71267d00')
sha384sums=('875a3b4edb7d2348a59a1c65923e1bad7a2e375066fc82526c29a844f320cd2277ea1f61c88f3e64a3f513154a5af0f1')
sha256sums=('d7fe34fffdc64f601ff74f5953c4042ec56fc0622a5ff1f9ef396dc4002b4f12')
