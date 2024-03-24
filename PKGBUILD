# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=0.20.0
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('390e931c3ddf6057c7d9c9b523962e190b69900464e6598c4fe218d5760f926f')
b2sums_x86_64=('95bdc89e9e2331a422ad3d7af6b9f979d161747ccebe8f9374939365d22dbc4b8c48abbb9fb0c865c9d5313519deb29fdcf7037f137a6de42844942c99b2bab5')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}