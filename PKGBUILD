# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-dashboard
pkgver=4.7.3
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc='Wazuh Dashboard for Arch Linux'
arch=('x86_64')
url='https://wazuh.com/'
license=('gpl2')
depends=(
    'libcap'
);
optdepends=(
);
validpgpkeys=(
  '9E646BB0630C8FD18ACD15541B93E6A766CD229D' #madara125 GPGKey
  '2B9D22B41F2AF1042BFCE73A3CA0B9DF1BE7CE09' #MrHacker GPGKey
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
  "${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm.sig"
)

backup=(
  'etc/wazuh-dashboard/certs'
  'etc/wazuh-dashboard/opensearch_dashboards.yml'
  'usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml'
  )

sha512sums=('83e6ba34cef7cb0f6c9f8539c93e7d17e67a31ca5957ff13ded00856e5f3553bf765d8a95eba493c517eef1010232174c7fc4d03654c7cc281340263aadc013a'
            'SKIP')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .

    #Set systemd service file perms
}
