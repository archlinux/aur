# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Daniel Oertwig <Daniel.Oertwig+customizepkgpatching at gmail dot com>
pkgname=customizepkg-patching
pkgver=20
pkgrel=1
pkgdesc="A tool to automate modification of PKGBUILDs using patch" 
#url="" 
license="GPL" 
arch=('any')
depends=('bash' 'diffutils' 'patch')
optdepends=('vim: For using vimdiff')
provides=('customizepkg')
conflicts=('customizepkg')
source=('customizepkg-patching') 

package()
{
        cd "${srcdir}"
        mv customizepkg-patching customizepkg
        install -d "${pkgdir}/usr/bin"
        install -t "${pkgdir}/usr/bin/" customizepkg
        install -d "${pkgdir}/etc/customizepkg.d"
}
sha384sums=('f6a5b704448b1060fc9766640717f60c66c535e2a18ec6df7ac2e5f45f2258a39e7e496b1a0c7e4ef3c3a3050e9b4a65')
