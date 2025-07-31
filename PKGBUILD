pkgname=proton-authenticator-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Proton Authenticator is an open-source TOTP authenticator from Proton (prebuilt binary)"
arch=('x86_64')
url="https://proton.me/authenticator"
license=('GPL3')
depends=('glibc')
provides=('proton-authenticator')
conflicts=('proton-authenticator')
source=("https://proton.me/download/authenticator/linux/ProtonAuthenticator_${pkgver}_amd64.deb")
sha256sums=('462e94eedb906b99dd7b8be36a040a7df5a01976d9b4034d99ea61d57e8f16e3')

package() {
    ar x ProtonAuthenticator_${pkgver}_amd64.deb
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    
}

