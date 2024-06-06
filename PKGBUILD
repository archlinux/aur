# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=proton-pass
pkgver=1.17.5
pkgrel=1
pkgdesc="Proton Pass desktop application"
arch=('x86_64')
url="https://proton.me/pass"
depends=()

source=(
    "https://proton.me/download/PassDesktop/linux/x64/ProtonPass_${pkgver}.deb"
)

sha512sums=('76a303dea07d312cf6056b004a6312564fa093af6a7bb7fb5e6d5fc977dc829f37b6ef043909dfcb07d633cead4c58e4bb7c84f783ea143fb5e7f083eee9d4d4')

package() {
    tar -xf data.tar.xz --no-same-owner -C "${pkgdir}"
}
