# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=nemo-run-with-nvidia-prime-run
pkgver=0.1.0
pkgrel=2
pkgdesc="Nemo action to run a program with prime-run for nvidia-GPUs"
arch=('any')
url="https://github.com/schinfo/${pkgname}"
license=('GPL2')
source=("https://github.com/schinfo/nemo-run-with-nvidia-prime-run/archive/refs/tags/0.1.0.tar.gz")
sha256sums=('3b8066f6f081163486e6d7a84b9e18678b479df2ac62a499890f150d9922eb0e')
depends=('nemo')

package() {
	install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/usr/share/nemo/actions/run-with-nvidia-prime-run.nemo_action" "$pkgdir/usr/share/nemo/actions/${pkgname}.nemo_action"
}

