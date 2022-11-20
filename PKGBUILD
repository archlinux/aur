# Maintainer: veggieTanuki <4d7orvu7@anonaddy.me>

pkgname=synth-bin
pkgver=0.6.9
pkgrel=1
pkgdesc="The Declarative Data Generator"
arch=("arm64" "x86_64")
url="https://www.getsynth.com/"
license=("Apache")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/shuttle-hq/synth/releases/download/v${pkgver//_/-}/synth-ubuntu-latest-x86_64.tar.gz")
sha512sums_x86_64=('3c13d17789e6382e3fc1e9bb190ded4f4abb399a12dadbb96d76a5528c710240dd84d385693a1e7a24ba8e8295a46752299f1602fff236e1e861da02147d0803')
source_arm64=("https://github.com/shuttle-hq/synth/releases/download/v${pkgver//_/-}/synth-ubuntu-latest-arm64.tar.gz")
sha512sums_arm64=('44f600f665504338f61a5a0b61d3deab6646a04ca00b762e67635cf6d1584ef030f0c2c2a4aa75642879354c3c48eb2823ac3ec19d79a4268a3ee084e06f58e1')

package() {
    install -Dm755 "synth" "${pkgdir}/usr/bin/synth"
}
