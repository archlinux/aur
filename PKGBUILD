# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on extra/electron by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>

pkgver=28
pkgrel=1
pkgname=electron-bin
pkgdesc='Meta package, always depends on the latest stable Electron binary build'
arch=(any)
url='https://electronjs.org'
license=(MIT)
depends=("electron${pkgver}-bin")

package() {
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "electron${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
