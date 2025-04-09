# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=nemo-run-with-nvidia-prime-run
pkgver=1.0.0
pkgrel=2
pkgdesc="Nemo action to run a program with prime-run for nvidia-GPUs"
arch=('any')
url="https://github.com/schinfo/${pkgname}"
license=('GPL2')
source=("https://github.com/schinfo/nemo-run-with-nvidia-prime-run/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cf039c3d2f65e420758c7edb979c90863d39171c808cf6ae2442260ef51a0cec')
depends=('nemo')

package() {
	install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/usr/share/nemo/actions/run-with-nvidia-prime-run.nemo_action" "$pkgdir/usr/share/nemo/actions/${pkgname}.nemo_action"
}

