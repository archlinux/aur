# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=nerd-fonts-dejavu-complete
pkgver=2.0.0
pkgrel=1
pkgdesc="All variants of Nerd-Font-patched DejaVu Sans Mono"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
raw_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts/DejaVuSansMono"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
install="${pkgname}.install"
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
sha512sums=(
  'ca49cf5ef4c71d6b1d843ad39b70438bb68024d51ccfb12fb190b7788e7d8434c9bdd76baa092d34bcbcad76922703dc67d0e7fadc317592ed7f32abc4a399c9'
  '4be46f414d03094d22e67d945f23d466282e38853881a99db26078e807ef500d07df650b3af2cf2d8fbf3453fa485d9480b58f3f633577c705d0ce2b0fba9323'
  '2dc6be508e3a7339abe67b17b52bbf43907d6ff808451ff9d57089d3510d15b948873d5e1105803405b2bafa16088eff879d4e225d8b285e0c857431d2148f76'
  'db613f98c6bc53910e6ff93d97addfa2305947f8063bbfd78fe26a901ac15cac434d4681def34a0fba033752900f35b58ac3ff2f2a6d33644638fa7d5db44662'
  '948753687f8065d22ea0a8e794524a505db54f7d700238c1c01112d74ef37bc13cc84916d663c36859b44aff71cb56e75bf8652641d99d06aafcb02d836dd61a'
  '10995c35eb356ce8d73c3e1fb2b849d26531845190552fc6907f10740fe3deadc7ca5829b24720e47af8b720b6e76ff539320b0fc85df10398794aa446a85955'
  'b4c99a64c7518b2c7d5325639930df79c57b9a5da53a478aa22c70ca8278dfbae3ede2c7fd1481299427404ce70b2a2b62df9c9a7dbeb2e62e4b96fe0c66ef90'
  'd0446a09a2aed03eb4162a226c151685065d418157d76816af034f7961a209021536aefbe161cfa035265d645327459487821b71454ce5d56f650dc4ef711e9c'
)

package() {

  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF

}
