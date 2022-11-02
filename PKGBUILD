pkgbase="hd"
pkgname="hd"
pkgver=1.5
pkgrel=93
pkgdesc="C makefile generator"

arch=("x86_64")

makedepends=()
depends=("glibc")

license=("Mimik1.2")

provides=()
conflicts=("hd-git")

url="https://github.com/Noah-Arcouette/hd"

source=(
	"https://github.com/Noah-Arcouette/HD/releases/download/releaseV1.5/HD-V1.5.7z"
)

sha256sums=(
	"09bae071e2627f84ae104548e3fd300596a4ab5c993c7bcee0fbb1c82dc6f163"
)

package() {
	# setup dirs
	mkdir -p "${pkgdir}/usr/bin/"

	# make binary root owned and executable
	chown root:root ${srcdir}/hd
	chmod a+x ${srcdir}/hd

	# copy binary
	mv "${srcdir}/hd" "${pkgdir}/usr/bin/hd"
}
