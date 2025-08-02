# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=proton-authenticator-bin
_name=${pkgname%-bin}
pkgver=1.0.0
pkgrel=2
pkgdesc='An open source and end-to-end encrypted 2FA app. Securely sync and backup your 2FA codes easily.'
arch=('x86_64')
url='https://proton.me/authenticator'
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=('libarchive')
provides=("$_name")
conflicts=("$_name")
source=("https://proton.me/download/authenticator/linux/ProtonAuthenticator_${pkgver}_amd64.deb")
b2sums=('424e7cf4f8283414d7c7f9b5b4cef0f1ec20eecbacb7d914d155e3a38d82121c8e6c72595d19e676d271962fd13a0992ea5218bfc6082dda896fbe4a8f5f4fb3')

package() {
    bsdtar -xvf data.tar.gz -C "$pkgdir/"
}
