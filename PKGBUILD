# Maintainer: Aleksey Barinov

pkgname=beam-wallet-bin
pkgver=5.3.10396.3625
pkgrel=1
pkgdesc="Beam Desktop GUI Wallet"
arch=('x86_64')
license=('Apache')
url='https://beam.mw'
conflicts=('beamwallet-bin')
source=("https://builds.beam.mw/mainnet/2021.02.17/Release/linux/Beam-Wallet-${pkgver}.deb")
sha256sums=('97c20217b6a49601986742d7ad5f7ec764521befb13705d808eee83fd2993ca0')

package() {
    tar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
