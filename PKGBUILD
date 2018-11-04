# Maintainer: jerry73204 <jerry73204@gmail.com>
# Contributor 1: Lee.MaRS <leemars@gmail.com>
# Contributor 2: Dominik Mayer <dominik.mayer@gmail.com>
# Contributor 3: Anuj More <anujmorex@gmail.com>

pkgname=google-appengine-java
pkgver=1.9.68
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

sha1sums=('d6127add4e5c6fb6824d7dec7c005206ed9216ba'
          '2b3afe55cfb6847b957ec10eec981363797ce09e')
