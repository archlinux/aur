# Maintainer: Aleksey Barinov

pkgname=beam-wallet-bin
pkgver=5.3.10410.3657
pkgrel=1
pkgdesc="Beam Desktop GUI Wallet"
arch=('x86_64')
license=('Apache')
url='https://beam.mw'
conflicts=('beamwallet-bin')
source=("https://builds.beam.mw/mainnet/2021.02.25/Release/linux/Beam-Wallet-${pkgver}.deb")
sha256sums=('b4f9b07657b9980321c508f61045be9b6b967b4d6037896f1b1b100cd07601ab')

package() {
    tar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
