pkgname="execute-script-after-mount"
pkgver="1.0.0"
pkgdesc="This is a program to execute a command after a drive was mounted."
source=("execute-script-after-mount-init")

sha512sums=("SKIP")
pkgrel="1"
arch=("x86_64")
license=("custom")

package() {
	mkdir -p "${pkgdir}/usr/local/sbin"
	cp "${srcdir}/execute-script-after-mount-init" "${pkgdir}/usr/local/sbin/execute-script-after-mount-init"
	chmod +x "${pkgdir}/usr/local/sbin/execute-script-after-mount-init"
}
