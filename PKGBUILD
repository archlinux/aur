# Maintainer: John Iannandrea <github.com/isivisi>

pkgname='slurp-vst-bin'
pkgver=1.1.3
pkgrel=1
pkgdesc="The freely distributed version of the SLURP VST Plugin."
url='https://isivisi.ca/slurp'
license=('SLURP-EULA')
arch=(x86_64)
groups=()
depends=()
makedepends=()

source=(
    "https://isivisi.ca/slurp/downloads/SLURP-linux-x64.zip"
)

sha256sums=(
    1376a99ac4140870a547dc03c96db45f950ecadfada9451d54161e471bc339f6
)

package() {
    install -vDm 755 ./bin/SLURP "$pkgdir/usr/bin/SLURP"
    install -vDm 644 ../SLURP.desktop "$pkgdir/usr/share/applications/SLURP.desktop"
	cp -r ./bin/SLURP.vst3 ~/.vst3/SLURP.vst3
    cp ./bin/SLURP.clap ~/.clap/SLURP.clap
}