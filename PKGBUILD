# Maintainer: John Iannandrea <github.com/isivisi>

pkgname='slurp-vst-bin'
pkgver=1.1.5
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
    732d2e124eaa06c9833654a98995b91e0a3769df0badd4be8abbcdafdef2bf61
)

package() {
    install -vDm 755 ./bin/SLURP "$pkgdir/usr/bin/SLURP"
    install -vDm 644 ../SLURP.desktop "$pkgdir/usr/share/applications/SLURP.desktop"
	cp -r ./bin/SLURP.vst3 ~/.vst3/SLURP.vst3
    cp ./bin/SLURP.clap ~/.clap/SLURP.clap
}