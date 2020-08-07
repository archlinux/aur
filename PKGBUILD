# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-archivo-narrow
pkgver=3.000
pkgrel=1
_commit="0a98e4dd59de05b0caa3273ccb47cbd5ec2274cc"
pkgdesc="Archivo Narrow was designed to be used simultaneously in print and digital platforms"
arch=('any')
url="https://github.com/Omnibus-Type/ArchivoNarrow"
license=('custom:OFL')
source=("https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-Bold.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-BoldItalic.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-Italic.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-Medium.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-MediumItalic.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-Regular.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-SemiBold.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/fonts/ttf/ArchivoNarrow-SemiBoldItalic.ttf"
        "https://github.com/Omnibus-Type/ArchivoNarrow/raw/$_commit/OFL.txt")
sha256sums=('2653e11aa4d327ba05e7681647203d08b3eab053133a49b5cd9a6b7ec7d8528a'
            '3a6177e7f845cf9627cfe52577a35243fdc5f95a17d15c0b4cfbee0d119f2100'
            'bd13f7e5639dc1d15179062d48518b96022c4548858e188693dbfc5974e4f967'
            '8e6e5cc836f3089a92c2f473c210f9bf7b8bbf858866bd651f8205039564fe3f'
            '448f2e840aadc5921a42f6a8db81bffce1b480ea9cbe4fedce821a783c47a188'
            '4cc05eb5d2cd6c0e1bb6bd0cd32f4409a86d8f1196175f734d0ef42003966c29'
            '9870ca133eba3cb525b32a4215b7604ec850c0781fdca07fc22ec8760332bdb2'
            'd8ba7fee44aba9166ad40dfc4a370084f2faaec59ac5a9eb12e1e63aac5e4822'
            'a4087edf95fb2a6bd38073ad005ced611695dc9d7d8fd5d04a888ef4f9c748ea')

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
