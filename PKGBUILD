# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mondoo
orignalVersion="10.3.3"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Mondoo Client CLI for the Mondoo Policy as Code Platform"
url="https://mondoo.com"
license=('custom')
source=(
    'LICENSE.html'
    'OSS-LICENSES.tar.xz'
    'mondoo.service'
    'mondoo.sh'
    )
arch=('x86_64')
depends=('cnspec')

sha256sums=(
            'f1a7d679603a68a01583d98252ca0079986962d3ceca9a47ce01e0640a42500f'
            'cd99e204a986af5a91f46c43478b28f556a4f50fd9721844d0b600d45ac43cb8'
            'b770c0e4c38aec2b9abd67e452cd0e76833fd83d9dd3690fcbad613d08a02f9c'
            '63b502366204dd5fa011866ea85e7236a82b0504e193a2b3f2235520a47790d0'
            )


package() {

  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.tar.xz "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.tar.xz
  install -Dm 644 mondoo.service "$pkgdir"/usr/lib/systemd/system/mondoo.service
  install -Dm 755 mondoo.sh "$pkgdir"/usr/bin/mondoo
  
}

#vim: syntax=sh