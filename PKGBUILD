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
