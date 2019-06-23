# Maintainer: jerry73204 <jerry73204@gmail.com>
# Contributor 1: Lee.MaRS <leemars@gmail.com>
# Contributor 2: Dominik Mayer <dominik.mayer@gmail.com>
# Contributor 3: Anuj More <anujmorex@gmail.com>

pkgname=google-appengine-java
pkgver=1.9.75
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Google App Engine SDK for Java'
url='http://code.google.com/appengine/'
license=('Apache 2')
depends=('java-environment')
options=('!strip')
source=("https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-${pkgver}.zip"
        'profile.appengine-java-sdk')
package() {
  cd "${srcdir}"
  mkdir "${pkgdir}/opt/"
  cp -R "appengine-java-sdk-${pkgver}/" "${pkgdir}/opt/${pkgname}"

  install -D -m755 profile.appengine-java-sdk "${pkgdir}/etc/profile.d/appengine-java-sdk.sh"
}

sha1sums=('15f6506bf64715bc3011a5b2b844f03e3391cbc6'
          '2b3afe55cfb6847b957ec10eec981363797ce09e')
