# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modification of Droid Sans Mono with Hasklig-style ligatures'
pkgname=ttf-borg-sans-mono
pkgver=0.2.0
pkgrel=1
arch=(any)
license=(Apache)
url=https://github.com/marnen/borg-sans-mono
source=("${pkgname}-${pkgver}.zip::${url}/files/107663/BorgSansMono.ttf.zip")
sha512sums=('85e9d47727b31ad71037012182082bec04a1b2480bdc0ef9abe4994e0a1b399b6ab36ff5de51798c97ae6a572d957ede81c8c9b8eab65d2dc130c11fadb6ea79')

package ()
{
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
