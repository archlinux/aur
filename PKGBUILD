pkgname=otf-rubik
pkgver=2.2.0
pkgrel=1
_commit=e9eb9abc38fe7a67eda07d5b77ad13b7dd52c560
pkgdesc="a sans serif font family with slightly rounded corners"
arch=("any")
url="https://github.com/googlefonts/rubik"
license=("OFL")
source=(
      "${url}/raw/${_commit}/fonts/otf/Rubik-Black.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-BlackItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Bold.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-BoldItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-ExtraBold.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-ExtraBoldItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Italic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Light.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-LightItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Medium.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-MediumItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Regular.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-SemiBold.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-SemiBoldItalic.otf"
      "${url}/raw/${_commit}/OFL.txt"
      "${url}/raw/${_commit}/AUTHORS.txt"
      "${url}/raw/${_commit}/CONTRIBUTORS.txt"
)

sha256sums=(
      "30b00cbdea9ffe8a8750a91d5607d8696a385f681f9c3f884e0b307c092ef06c"
      "9b3fd0fc8758e683343dd6e57153406cdc17a7ebe94fb5cb7739404f35fe3b13"
      "a9f46d3e666356e32048ec2e6c7ac74d653b291337b1e92dc660d3c71e488ba0"
      "0e7662439a1cae8fd195e9c32c7daf47577fe3a0cebff50f53e978b0514f1387"
      "9ea51cd06626248b24dc1ecc5645f7c5b3af4ff0d09108c3673960f2ced0d5f0"
      "db58624867ff449ff4cfc3a24804bd8d8d5edbea67eff7c57579b012e14d57ef"
      "72951cf7c6053d59d55aef0ecba70d5b5caf9f631f10e43f666e3698de8ebb8a"
      "4816e6632373a3cbe8d97be48bca8c79b35e8dd3447b6909becf43e2a8df84f6"
      "d18bfc043efdad944211446b4ba1dc751df677e96ef74b215fc059400cda1546"
      "3bec425434a0c8bca73ce412d76d66d7b6caab2567058c63d1fdb8b492064f70"
      "0c5eb1f6f323d31a3589c95ee5354db6a43f4d8075a191ee9ff5bf2d2ef772ee"
      "5f7bd586d1a98f2099beb2dd4f29fae136d5cbec53a742e3cac9448ffb25f472"
      "ee71b1e47bc9793be7e1aa4622c4e573e37ab31a1fbe38827fd9f2f8def04a1e"
      "12f2238b4e6e567d13c82122a28f350ca1c6b74c0d093d13dbd9d427daf63155"
      "472cbe7c25441df63e9c7864b43eb3c0f4b3df950c66a76224e6cfe1eae843fb"
      "7e2cf473951e887dc83a6676ab3ce19eef293cd0e5b4d15504dcc42228934576"
      "d0955625026fcda3c16cbf518486e7e272ef3a4ca86ef11daafc2892cabb59b6"
)

package() {
      install -d ${pkgdir}/usr/share/fonts/OTF
      install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF/
      cd ${srcdir}
      install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ OFL.txt AUTHORS.txt CONTRIBUTORS.txt
}
