# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname="sway-desktop-env-hook"
pkgver=2.0
pkgrel=1
pkgdesc="Adds XDG_CURRENT_DESKTOP, XDG_SESSION_DESKTOP and XDG_SESSION_TYPE definitions to sway.desktop!"
arch=('any')
url=""
license=('GPL-3.0')
depends=(
    'sed'
)
provides=("${pkgname}=${pkgver}")
source=(
    "sway-desktop-env.hook"
)
install=${pkgname}.install

package() {
    cd              "${srcdir}"

    install -Dm644  'sway-desktop-env.hook'  "${pkgdir}/usr/share/libalpm/hooks/sway-desktop-env.hook"
}
sha256sums=('c2a26a6c10d1e32153544db15d4c9ffe74ff54309add62f75ad3b8d5d6e24dcd')
sha384sums=('1ddbf3063c68525970a8b863ca8c79a6633ab87d46bfc930aaaae24cc221aca552f7bac6908d58ec9926f97d72dcdfb5')
sha512sums=('3a0822148064c370d104b6b42abd62b0d998f40b1f497e7b66a30532fcbb5018d55e868ebf084c2d211b5867d0e83d39ecf3139ff7cab40ab5fd8acfb602a82c')
b2sums=('7869592748105f032daa32fccc397c8de8de252f9d88db73a2472030aa61591ceccf996dd8c3be25292c97bd4f16940d2dcc716b7d9f26c7949fd8dafb8ee403')
