# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=2.1.0
pkgrel=2
pkgdesc="All variants of Nerd-Font-patched DejaVu Sans Mono"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
raw_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts/DejaVuSansMono"
license=('MIT')
provides=(ttf-font)
source=(
  "DejaVu-Sans-Mono-Bold-Nerd-Font-Complete.ttf::${raw_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete.ttf"
  "DejaVu-Sans-Mono-Bold-Nerd-Font-Complete-Mono.ttf::${raw_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVu-Sans-Mono-Nerd-Font-Complete.ttf::${raw_url}/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf"
  "DejaVu-Sans-Mono-Nerd-Font-Complete-Mono.ttf::${raw_url}/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVu-Sans-Mono-Oblique-Nerd-Font-Complete.ttf::${raw_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20Nerd%20Font%20Complete.ttf"
  "DejaVu-Sans-Mono-Oblique-Nerd-Font-Complete-Mono.ttf::${raw_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVu-Sans-Mono-Bold-Oblique-Nerd-Font-Complete-Mono.ttf::${raw_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVu-Sans-Mono-Bold-Oblique-Nerd-Font-Complete.ttf::${raw_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20Nerd%20Font%20Complete.ttf"
)
sha512sums=('1882071b98de64ee0b6ae9eb3130eaf1147198a099d95b85227b8728635a7fbd0cdfd3ce606c299a1988a854a7c151f7a710b7412c9e27004625e6b708210d80'
            '552c6fe505bd4e4dbd1426ef97125959f5c034461bf97bbcbbf3776cb786f5dc6b36fec4b8e8616bd6e3a416154f17f7167bb2978f5bb4803be9ce1b29eeafbc'
            'bca844f59bea5158d2796a4bbe3dee130ae7304af8245378cab38f5665fff80da5030f2fc3bc8ab6ecc6044002d48706ac5db25e003635795837345132857b26'
            'ec0cad3a783a9ba76e5983614743aba77c836923449cfd5ade54435adeef6570da9759c41ebc7514daac6bcba27055d36907266b8bec9eb148ef580f72ac517f'
            'da834cae75890fae58b4ba25cacd0850de635524aa5ee302b28944b85409d78243ec933f536b00a5b291d3eb08296ba2d7b8b7202af1b6113232b93b5012d773'
            '965284e4c8ae1f2bef8205c8fe4a31b186b2b5897d8360c92c4757f4e54f26d7d510386b038276253e5254e9b0f4d96e74b3703d6eb6a4769244d66c965d7734'
            'f85694c28ec098ad6cb5b88cc28854dd41580ce35b4c85be18ffa6bac82ed240f39e0470e116ced6407d55b28fb00cad05dcf4749ae7fe31ff62011778f79087'
            'ed2a3f74144117d640ac0729333226aad5a060b304062477e8aa90d0d17a642117b5d4da3be4318b9d8967e78b33f4c7f156bef8d087b83b977e0202fcff343c')

package() {
  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
}
