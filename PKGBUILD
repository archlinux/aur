# Maintainer: Aleksey Barinov

pkgname=beam-wallet-bin
pkgver=5.2.10113.3424
pkgrel=1
pkgdesc="Beam Desktop GUI Wallet"
arch=('x86_64')
license=('Apache')
url='https://beam.mw'
conflicts=('beamwallet-bin')
source=("https://builds.beam.mw/mainnet/2020.12.03/Release/linux/Beam-Wallet-${pkgver}.deb")
sha256sums=('9f6833a46bec91d2b7423b5a4e78f590f0e59b6b8a87d937ae3c717d198d5bdb')

package() {
    tar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
