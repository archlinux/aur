# Maintainer: Aloxaf <aloxafx@gamil>

pkgname=rescue
pkgver=20180910
pkgrel=1
pkgdesc="An automated tool for the detection of regexes' slow-matching vulnerabilities."
arch=("x86_64")
url="https://github.com/2bdenny/ReScue"
license=('GPL2')
depends=('java-runtime')
source=(
	"https://github.com/2bdenny/ReScue/raw/master/release/ReScue.jar"
	"rescue"
)
sha256sums=(
	"5f2724cd2793c7cd568be1a1d8b990d0663117efbfaae44a2465f5904a4bed46"
	"4590dec58db8048c7027b0143c40badbc66ee5575ee05a7671653eb964b66594"
)

package() {
	install -D ReScue.jar "${pkgdir}/usr/share/java/rescue/ReScue.jar"
	install -D rescue "${pkgdir}/usr/local/bin/rescue"
}
