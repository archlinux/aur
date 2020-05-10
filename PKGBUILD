# Maintainer: Nish <nin3ty1@gmail.com>
pkgname=otf-scunthorpe-sans
pkgver=2
pkgrel=1
pkgdesc="A s*** font that f***ing censors bad language automatically."
arch=('any')
url="https://vole.wtf/scunthorpe-sans/"
license=('custom:CC0')
provides=('otf-scunthorpe-sans')
source=('https://vole.wtf/scunthorpe-sans/scunthorpe-sans.zip?v=2'
        'http://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
sha256sums=('1af4722a0b2d4bef5019cf223e552a09d167eb8d4df4e75ffa9add9fdcfbe44b'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {

  install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 scunthorpe-sans.otf "${pkgdir}/usr/share/fonts/OTF/"
}

