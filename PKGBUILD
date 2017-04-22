# Maintainer: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Maintainer (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): Figue <ffigue at gmail>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Contributor (Parabola): vando <facundo@esdebian.org>
# Thank you very much to the older contributors:
# Contributor (Parabola): evr <evanroman at gmail>
# Contributor (Parabola): Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>

pkgname=mozilla-searchplugins
pkgver=1.10
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
            'c97928bf25bff6c11d3cdb8f0df68b04c743a8fb3c8c51511e9179754d7fb231'
            'ec4a1054f4b9cca9cf410b3302fa86e2322a8dfdfe560b5dbbabba7d0bdd3197'
            '2480ca917a10d0955b818498171ecff6b86faf2eeae25684dd617ec4da40d585'
            '5e249e946193da91c95ade7f60fe227c28b99ecf40aba717b77d004ac9080905'
            '11aefd859c970b1bfce755b32177e5f608d39a0cad0b3d3b0b47f49437f35225'
            '44d8d849806e21a8e32489ade3e8191c4b4b23b416632beb258dea2484ed4ea3')
