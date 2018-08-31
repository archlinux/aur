pkgname=ttf-opendyslexic
pkgver=1
pkgrel=3
url="https://github.com/antijingoist/open-dyslexic"
license=('Bitstream Vera License')
pkgdesc='OpenDyslexic is a new open source font created to increase readability for readers with dyslexia. It was built on Jim Lyles’s Bitstream Vera Sans, and is free for Commercial and Personal'
arch=('any')

source=("https://github.com/antijingoist/open-dyslexic/archive/20160623-Stable.tar.gz")

sha256sums=(
	'a44fde7d5fcf1e3825d00de20f7d71fb7b339a7e71067cd9566e8ab16692802a'
)
install=$pkgname.install

package() {
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/

	install -Dm644 "${srcdir}"/open-dyslexic-20160623-Stable/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF/

	install -Dm644 "${srcdir}"/open-dyslexic-20160623-Stable/README.md "${pkgdir}"/usr/share/licenses/${pkgname}/README_ttf_OpenDyslexic.md
}
