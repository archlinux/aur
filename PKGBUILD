# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=2.2.0
pkgrel=1
pkgdesc="All variants of Nerd-Font-patched DejaVu Sans Mono"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
_raw_base_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}"
_raw_font_url="${_raw_base_url}/patched-fonts/DejaVuSansMono"
license=(MIT)
provides=(ttf-font)
source=(
	"DejaVu-Sans-Mono-Bold-Nerd-Font-Complete.ttf::${_raw_font_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete.ttf"
	"DejaVu-Sans-Mono-Bold-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
	\
	"DejaVu-Sans-Mono-Bold-Oblique-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20Nerd%20Font%20Complete%20Mono.ttf"
	"DejaVu-Sans-Mono-Bold-Oblique-Nerd-Font-Complete.ttf::${_raw_font_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20Nerd%20Font%20Complete.ttf"
	\
	"DejaVu-Sans-Mono-Oblique-Nerd-Font-Complete.ttf::${_raw_font_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20Nerd%20Font%20Complete.ttf"
	"DejaVu-Sans-Mono-Oblique-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20Nerd%20Font%20Complete%20Mono.ttf"
	\
	"DejaVu-Sans-Mono-Nerd-Font-Complete.ttf::${_raw_font_url}/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf"
	"DejaVu-Sans-Mono-Nerd-Font-Complete-Mono.ttf::${_raw_font_url}/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"
	\
	"LICENSE::${_raw_base_url}/LICENSE"
)
sha512sums=('09ac9479c30c21b98887296cce47e240b6942ade185d00b2331f3b7619b816782a5f36e77ef57e82ba7658c2e5f3eeef0082bbacdc2d13a6dcbad1a08e90fe03'
            '85ac7db4ecb156e55e19642a4cdde65c46d41d06dea8ce6b2c46bf39f841062efaa6c796976f32e8d873a9723f0f4af48ebd84e3dc902c1510085875fabf2e04'
            '01368db162dc4c645579f1d5ea02be3a3cf4c4d428aa689d7e4c89f6dabd48607c6749db06ac775846009b2d45db4d27df07235cc0c6b89f8684919c34410c6f'
            '61185e6257c086af2c51a14273615359eaaa5af027ed1e9690a4f1d3e7d4872cdd21f4ce8bf97dbd2e6606d5344b332741a58edd86ccc576c27ffd7cb7f35919'
            '491b8eeeef71626635cd1054bce03a6641bad789f9643133332eaf842c0b97af515f197a4c2f57e3e9251554c929a434e92cd5f38f1c17153a2ab14bd942d092'
            '8d38c848df93b2d7621dc4b1cdea95c8ed9c0d8e0f3d030e2d56f411c56a72db3bf809b90583b861ef9fc375ede28736b6b9ab617d9da096f7b107c2332f2048'
            '4c52b14f15dd0b3f2e32992b925c4daae8ffc7e8550cd9862bfa9f581b52956f37d4abc57ca9b5808240d53dd32bd60f952e89788660a3322a61b8f577dfe8dd'
            'cc9d043cbc0a4111a1acf4e16b421c6c2ebf3762b008839e9ebdc78d45135f640f21f728a549d9487be55692d32514703d2fdd178b44a0eb54c01cb67dc3301d'
            '941169ae9f04d4d706fead04cc2391c57b681c934f5d646a1444d9a1240ba42500a5ea79ae5d1bb172666f6d48d44d95fa757a5785593088d887736d58f4cc82')

package() {
	install -dm0755 "${pkgdir}/usr/share/fonts/TTF"
	install -Dm0644 -t "${pkgdir}/usr/share/fonts/TTF" ${srcdir}/*.ttf
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${srcdir}/LICENSE
}
