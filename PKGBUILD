# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: josephgbr <rafael dot f dot f1 at gmail dot com>
# Contributor: Maribu <leonidas200 at web dot de>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=lib32-gdbm
pkgver=1.26
_translation_version=1.26
pkgrel=1
pkgdesc='GNU database library (32-bit)'
arch=('x86_64' 'i686')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL-3.0-or-later')
depends=('gdbm' 'lib32-glibc')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz"
	https://translationproject.org/PO-files/da/${pkgname:6}-$_translation_version.da.po
	https://translationproject.org/PO-files/de/${pkgname:6}-$_translation_version.de.po
	https://translationproject.org/PO-files/eo/${pkgname:6}-$_translation_version.eo.po
	https://translationproject.org/PO-files/es/${pkgname:6}-$_translation_version.es.po
	https://translationproject.org/PO-files/fi/${pkgname:6}-$_translation_version.fi.po
	https://translationproject.org/PO-files/fr/${pkgname:6}-$_translation_version.fr.po
	https://translationproject.org/PO-files/ja/${pkgname:6}-$_translation_version.ja.po
	https://translationproject.org/PO-files/ka/${pkgname:6}-$_translation_version.ka.po
	https://translationproject.org/PO-files/pl/${pkgname:6}-$_translation_version.pl.po
	https://translationproject.org/PO-files/pt_BR/${pkgname:6}-$_translation_version.pt_BR.po
	https://translationproject.org/PO-files/ro/${pkgname:6}-$_translation_version.ro.po
	https://translationproject.org/PO-files/ru/${pkgname:6}-$_translation_version.ru.po
	https://translationproject.org/PO-files/sr/${pkgname:6}-$_translation_version.sr.po
	https://translationproject.org/PO-files/sv/${pkgname:6}-$_translation_version.sv.po
	https://translationproject.org/PO-files/uk/${pkgname:6}-$_translation_version.uk.po
	https://translationproject.org/PO-files/vi/${pkgname:6}-$_translation_version.vi.po
)
#options=('!makeflags')
sha512sums=('44aafe254f0950a8f5215d8f1337674f07b19f2a375f6eb19a7e39690028c80c3774b705c2b76b470ae74042b21f2ca77d02f6f57aa2ee50296db801220a3352'
            'c4769afe6c72e5ac4047b2b2da1688bed7a8fa0d18b12e44d8eec906baf8f35ccf4d0d451da13815f67e1c3994561dd714a45585181eff4b40e44b407a33001c'
            'd909853c81ecfa0cbcb9777a93550ae95d3566f8cdb95fab9e886f7acaa96ae2c631e825c7c49a42ed3d3af6e376a61c2079d6ece432644a5d1680d8932baf9b'
            'dee1aa87071ca7d66ceee547b1b5d1d3c0de3f08a82e0a6b3c9aa733f404f7b2e52d7f1b151d6306f43f8fe5061965598d0b1034421e9efb2ba2b8f2a18bfec0'
            '5860a4193bd34ffeb06277debb540dbfa8147cb0b1398c26b665c2e38f1d995eb66ede1d618f76135bd8617543889c67b46c3aa622b454c5da86429565288194'
            '841c34a6a3b238525b699fd326140c5744346f4467ada18f829ee675dd9d737c1adae4c675def2f9b306d3d846e86a2f4be91010c5b846ffa128b004e1a037c6'
            '7aa7148818da74527a1db43df6be38ec207ef7003e316a98fef4493e7129ae18a4c515b62ef9e6cd5657cca6d7bd93d6fd01d3e11d71d9b862056f0e6383dfa9'
            'b59550186e6dbedf089716c614aa80c5fde602949b6e197ea95123e78ae2643623ef996d661c0df61fd9acf8828a89d3828e40fc11f7c338af3db49746120fcf'
            '4dde66dabd1572881da0c4743016b59dae721306282deee161be1b98934f202bcf739e875ed7317f412694eb114454efbb00e14799c4cb582b21f133433aed1a'
            '45ea221adb8d0560575a6f12b2d6bcd3a6a1843dd5aac9a93c124cb87383284f63d9948a89808fd49a1131e157e98d9eb29d992b1f90ba55443ff0a276d4bcca'
            'ac1a26682a8d7184b03de03a856ce92ad988bcbbba2f3b55823feb6576cfc19dc9e18c3147e05042f8c4f3029125e19615d69e084326423252d3cc7efe081346'
            '0795ec342151fa9e1bc60c1f02dcdb59a963e610b3026995354b37c9152d42dea1804d2054d235cb5bd6bcad3b48e3ef169da1889743c0de0d5cee8326c62d2a'
            'cd67f5f47ec401c3586176394d939b83c2e8bd74fd2e8ac77153e6efc77b4a62dc6789bfdb25ace9833f9dfe4500bd6dff2ac51e9d5af7a0b15fc02d306594a6'
            'ab0d9336e5e70eeea876c41f5428e7ee88829ba2fde5ba37c29551288b97ea59bafa88507fc40ead40ec7981fdf772881292001e55eb39117a6b5ff2262cbb43'
            '25a7b59c5f0b54928501a1efd3566e696e853382d7f41bb5247fb8d777cece9db81e8db1e1e751f15eb71df9f0972a21d5715f9ccbb6f37f3c575e7e4e8e0b2e'
            'd6f813ba690dd681aabbcf8552161a112e4586d05665e9749cce569bcdc792714d40861f47704b755d778c115b54f0a819d6628a452e195e5cafa67e666f7f91'
            '4b38a5f3d6bdee9cb0ad8e464de4c6901d280a546053ec652ca01ee34b9c9f1fd8cfc1760c8396515de3674b85379a65ee6d298afc4b2019c83232d74e1abb9e')


prepare(){
  cd "$srcdir"
  for po_file in *.po; do
	  new_po="${po_file/gdbm-$_translation_version./}"
	  cp -v $po_file "$srcdir/${pkgname:6}-$pkgver/po/$new_po"
  done

  cd "$srcdir/${pkgname:6}-${pkgver}"
  autoreconf -fiv

}


build() {
  cd gdbm-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-libgdbm-compat
  make
}

package() {
  cd gdbm-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,share,include}
}
