# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ttf-century-gothic
_pkgname=century-gothic
pkgver=1.0
pkgrel=1
pkgdesc="Century Gothic TTF typeface"
arch=(any)
url="http://www.911fonts.com/font/family/century_gothic"
license=(custom)
source=("CenturyGothic.ttf::http://www.911fonts.com/fonts/font-download-file/42933"
        "CenturyGothicRegular.ttf::http://www.911fonts.com/fonts/font-download-file/4365"
        "CenturyGothicBold.ttf::http://www.911fonts.com/fonts/font-download-file/4637"
        "CenturyGothicBoldItalic.ttf::http://www.911fonts.com/fonts/font-download-file/4638"
        "CenturyGothicItalic.ttf::http://www.911fonts.com/fonts/font-download-file/4641")
sha256sums=('3a9cbb5d75b2a2b0d22dc94571608e4e9dc7b88e825374985880c5722c1c9e5f'
            '64654e2515da88ca0c470c69b45341a0dda7f066a5f0c72cd6f2a929cdedd461'
            '90cb613b492874a560c0ff18a3402b1d24fb7e846dff11295d5c4644d6c75e83'
            '2dc5949d57d2e172601fb6f5093c1fbf15a463e29ed47c4c8ff2434baf1c2b19'
            '6cf57be6f9d0bd60bd5dc6eee7c11e87e5b19df210156495a524b974185b9fb9')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF/${_pkgname}

	# TODO find license
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
