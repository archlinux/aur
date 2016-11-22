# Maintainer: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=0.9.0
pkgrel=1
pkgdesc="All variants of Nerd-Font-patched DejaVu Sans Mono with complete+powerline option"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
raw_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/${pkgver}/patched-fonts/DejaVuSansMono"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
install="${pkgname}.install"
source=(
  "DejaVuSansMono-for-Powerline-Nerd-Font-Complete.ttf::${raw_url}/Regular/complete/DejaVu%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.ttf"
  "DejaVuSansMono-for-Powerline-Nerd-Font-Complete-Mono.ttf::${raw_url}/Regular/complete/DejaVu%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVuSansMono-Oblique-for-Powerline-Nerd-Font-Complete.ttf::${raw_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20for%20Powerline%20Nerd%20Font%20Complete.ttf"
  "DejaVuSansMono-Oblique-for-Powerline-Nerd-Font-Complete-Mono.ttf::${raw_url}/Italic/complete/DejaVu%20Sans%20Mono%20Oblique%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVuSansMono-Bold-for-Powerline-Nerd-Font-Complete.ttf::${raw_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20for%20Powerline%20Nerd%20Font%20Complete.ttf"
  "DejaVuSansMono-Bold-for-Powerline-Nerd-Font-Complete-Mono.ttf::${raw_url}/Bold/complete/DejaVu%20Sans%20Mono%20Bold%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf"
  "DejaVuSansMono-Bold-Oblique-for-Powerline-Nerd-Font-Complete.ttf::${raw_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20for%20Powerline%20Nerd%20Font%20Complete.ttf"
  "DejaVuSansMono-Bold-Oblique-for-Powerline-Nerd-Font-Complete-Mono.ttf::${raw_url}/Bold-Italic/complete/DejaVu%20Sans%20Mono%20Bold%20Oblique%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf"
  "LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DejaVuSansMono/LICENSE.txt"
)
sha512sums=('f42a57189b9f83ab8975d179a01108e7c077ca05d06e05e0a96dc15d41e9f032f44d2de17ac22cfbe1b696dc241f957f2c32c2bbebed8d36f6776c2ce16220a9'
            'b85860920ff8ef464988ce3cbe77aa55a89c2a0621f0f809bf0f009dcfad0a73adc877f7d8fcd4ddbca406ade9a89db6b4928b7c6cf0fdea94c18153fd0f610a'
            'a95a3ff35aeb3ec1d6f7039a4dae58c6a449d65abc395e78cc53463a97987f0c93139444916b3ef6cb6e808e5985e5529478294efee9d2aed54175c8f542c93a'
            'f030ed94a313fe4f28a5e1613fcd1a245287554629dbf53273f61490ffed3f8a151385a8593f8d5c9ae756d9b9df62f08fdad33edd31fa9678ca77e125eee215'
            '53ad5123eeb40d4c2310d3d76663f544559d3867775eb7ec2c5369b99c0824dbaaf06a1c0394a09fdad81b604ee75f57cd098b2b50ee8c0bb8e6ac0ba9430e7c'
            '5402ba8e2506bb74fe9ce8a99de85cb007d5cafbad82ebec831561266374dc0d98b8689f72a7fd104bd39958adf694eee8d0a38d83419b572599690617f9b32c'
            'f3a1677b4e6d07facb1c65129fc40902879b8d4da3a4b3335841439f0925b8af611b4a899d837736e06a1f4f371d1d22b5cc84d470208b66374ed2ddcf889cb9'
            'efa2043fe6276611328aa10828c2e03981bc2f90afcf755e308a2193d1555783a8b1ed9fcbe93acbb97d909746a2bd831b33a0eb86a4a54e30641f54145ab03a'
            '5fd1a814b4a43f033010b5f414c1a4d6fa7df5099821aebf1cb09dc5b0fd0d6a6b1e73b1bc93ac0f508125f86029f5356750dc30da0451bac9285e680275d699')

package() {

  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -dm0755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

}
