# Maintainer: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: Figue <ffigue at gmail>
# Contributor: Figue <ffigue at gmail>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Contributor: vando <facundo@esdebian.org>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Thank you very much to the older contributors:
# Contributor: evr <evanroman at gmail>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com> 

pkgname=mozilla-searchplugins
pkgver=1.9
pkgrel=1
pkgdesc="System-wide OpenSearch plugins common for Mozilla based browsers."
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.parabola.nu/"
source=(
  list.txt
  searx.xml
  duckduckgo-html.xml
  duckduckgo-lite.xml
  seeks.xml::https://seeks.ru/opensearch.xml
  internet-archive.xml
  parabola-packages.xml::https://www.parabola.nu/opensearch/packages/
  parabola-wiki-en.xml
  yacy.xml
  wikipedia-en.xml::https://en.wikipedia.org/w/opensearch_desc.php
)

package() {
  install -m755 -d                   "${pkgdir}/usr/lib/mozilla/searchplugins"
  install -m644 "${srcdir}"/*.xml    "${pkgdir}/usr/lib/mozilla/searchplugins"
  install -m644 "${srcdir}"/list.txt "${pkgdir}/usr/lib/mozilla/searchplugins"
}

sha256sums=('f05c7f1505a2511ccb5a58174ed52605238431ae880e526176393fe72b73ffb9'
            '3e95dff7d062889c86531aa80962b80e3c0d6c87244ec838963b313193c3f367'
            'cd8e9eb45567cb362acf607e65fcabfaf682f0051a251aa6a616ca25cd77106e'
            '1cd8dc8d1275a4e1fa10187997a0558f578c21a91e97c48222448e485de35d6a'
            '7ee18525957e05326db0bb2d6264bdceaf754b4df0a2fbe27d36707b7afae821'
            'ec4a1054f4b9cca9cf410b3302fa86e2322a8dfdfe560b5dbbabba7d0bdd3197'
            '2480ca917a10d0955b818498171ecff6b86faf2eeae25684dd617ec4da40d585'
            '5e249e946193da91c95ade7f60fe227c28b99ecf40aba717b77d004ac9080905'
            '8ed0e09a96020c5ba0df60b74c37a23d1bb1f2c80b04608abed3d1d450001722'
            '44d8d849806e21a8e32489ade3e8191c4b4b23b416632beb258dea2484ed4ea3')
