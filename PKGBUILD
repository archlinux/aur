# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Pixi"
_name="${_Name,,}"
pkgname="${_name}-editor"
_commit_rel="e664569255157825d9a3d7a9630562e312b6a375" # 0.1.0
_commit="b1d6b0f71fab4d760d85c1c342e1cd36a0728d9c" # r413
pkgver="0.1.0+r413+g${_commit::7}"
pkgrel=1
pkgdesc="Pixel art editor made with Zig"
arch=('aarch64' 'x86_64')
url="https://github.com/foxnne/${_name}"
license=('MIT')
depends=('glib2' 'glibc' 'gtk3')
makedepends=('anyzig' 'gendesk') # 'zig>=0.13' 'zig<0.14'
_pkgsrc="${_name}-${_commit}"
_zig_deps=(
  # pixi
  "mach-b14f8e69ee8eb834695eb0d0582053e555d10156.tar.gz::https://pkg.machengine.org/mach/b14f8e69ee8eb834695eb0d0582053e555d10156.tar.gz"
  "zig-imgui-8cb1c5a05315fb1e59f7dc4a5bde4e66dabc8fe7.tar.gz::https://github.com/foxnne/zig-imgui/archive/8cb1c5a05315fb1e59f7dc4a5bde4e66dabc8fe7.tar.gz"
  "zstbi-d9a0947365b1ee8131fcf518feac8dfe896cfcfa.tar.gz::https://github.com/foxnne/zstbi/archive/d9a0947365b1ee8131fcf518feac8dfe896cfcfa.tar.gz"
  "zmath-9620a611a8c039711dc780bf296d8dc100d16d3a.tar.gz::https://github.com/foxnne/zmath/archive/9620a611a8c039711dc780bf296d8dc100d16d3a.tar.gz"

  # mach
  "mach-freetype-d63efa5534c17f3a12ed3d327e0ad42a64adc20a.tar.gz::https://pkg.machengine.org/mach-freetype/d63efa5534c17f3a12ed3d327e0ad42a64adc20a.tar.gz"
  "font-assets-b2336a29b1ae633d47452a2041b258e9538ef5f0.tar.gz::https://github.com/hexops/font-assets/archive/b2336a29b1ae633d47452a2041b258e9538ef5f0.tar.gz"
  "mach-objc-79b6f80c32b14948554958afe72dace261b14afc.tar.gz::https://pkg.machengine.org/mach-objc/79b6f80c32b14948554958afe72dace261b14afc.tar.gz"
  "xcode-frameworks-9a45f3ac977fd25dff77e58c6de1870b6808c4a7.tar.gz::https://pkg.machengine.org/xcode-frameworks/9a45f3ac977fd25dff77e58c6de1870b6808c4a7.tar.gz"
  "directx-headers-eae9b3b8a84a32ae9e67025fd64e8d8b7755e628.tar.gz::https://pkg.machengine.org/directx-headers/eae9b3b8a84a32ae9e67025fd64e8d8b7755e628.tar.gz"
  "opengl-headers-d0b37fdc3b039ba5b430110545f398f0278c5396.tar.gz::https://pkg.machengine.org/opengl-headers/d0b37fdc3b039ba5b430110545f398f0278c5396.tar.gz"
  "vulkan-zig-generated-4134f910302a71731d8d32c91cfc1bc914e6d26b.tar.gz::https://pkg.machengine.org/vulkan-zig-generated/4134f910302a71731d8d32c91cfc1bc914e6d26b.tar.gz"
  "linux-audio-headers-81f1f13828a8b62467200ba2a0b0d911c4d089a7.tar.gz::https://pkg.machengine.org/linux-audio-headers/81f1f13828a8b62467200ba2a0b0d911c4d089a7.tar.gz"
  "wayland-headers-7c53e7483c3cfb5c6780ae542c9f5cfa712a826a.tar.gz::https://pkg.machengine.org/wayland-headers/7c53e7483c3cfb5c6780ae542c9f5cfa712a826a.tar.gz"
  "x11-headers-bc049ff07d31014d4d409cc328c3feb57c9b9a83.tar.gz::https://pkg.machengine.org/x11-headers/bc049ff07d31014d4d409cc328c3feb57c9b9a83.tar.gz"
  "zigimg-48bfe6d413a5b3723a7bcf36f1fabbba30efef68.tar.gz::https://github.com/zigimg/zigimg/archive/48bfe6d413a5b3723a7bcf36f1fabbba30efef68.tar.gz"
  "mach-opus-32712fd091636037959720ee00036a060816a4f0.tar.gz::https://pkg.machengine.org/mach-opus/32712fd091636037959720ee00036a060816a4f0.tar.gz"
  "mach-example-assets-dbc61a1470579a7834530567011227b1e680f2af.tar.gz::https://pkg.machengine.org/mach-example-assets/dbc61a1470579a7834530567011227b1e680f2af.tar.gz"
  # zig-imgui
  "mach-c56d596ea90be5502db7a83940f5cca4cce1494f.tar.gz::https://pkg.machengine.org/mach/c56d596ea90be5502db7a83940f5cca4cce1494f.tar.gz"
  # "mach-freetype-d63efa5534c17f3a12ed3d327e0ad42a64adc20a.tar.gz::https://pkg.machengine.org/mach-freetype/d63efa5534c17f3a12ed3d327e0ad42a64adc20a.tar.gz"
  "imgui-1.90.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v1.90.tar.gz"

  # mach-freetype
  "freetype-972cd37bccecae2cc9f54cf0b562263a13209d02.tar.gz::https://pkg.machengine.org/freetype/972cd37bccecae2cc9f54cf0b562263a13209d02.tar.gz"
  "harfbuzz-c514da98afcf5d9ad6854a7f09192f9ecfaeb061.tar.gz::https://pkg.machengine.org/harfbuzz/c514da98afcf5d9ad6854a7f09192f9ecfaeb061.tar.gz"
  # "font-assets-b2336a29b1ae633d47452a2041b258e9538ef5f0.tar.gz::https://github.com/hexops/font-assets/archive/b2336a29b1ae633d47452a2041b258e9538ef5f0.tar.gz"
  # mach-opus
  "opusfile-3eb6f231cb7bfed63d68e5b6bfdd5b08adb64223.tar.gz::https://pkg.machengine.org/opusfile/3eb6f231cb7bfed63d68e5b6bfdd5b08adb64223.tar.gz"
  "opusenc-456cbba13168cc5b999e19256bc78e977ce18fc8.tar.gz::https://pkg.machengine.org/opusenc/456cbba13168cc5b999e19256bc78e977ce18fc8.tar.gz"
  "linux-audio-headers-81f1f13828a8b62467200ba2a0b0d911c4d089a7.tar.gz::https://pkg.machengine.org/linux-audio-headers/81f1f13828a8b62467200ba2a0b0d911c4d089a7.tar.gz"
  # mach
  # "mach-freetype-d63efa5534c17f3a12ed3d327e0ad42a64adc20a.tar.gz::https://pkg.machengine.org/mach-freetype/d63efa5534c17f3a12ed3d327e0ad42a64adc20a.tar.gz"
  # "font-assets-b2336a29b1ae633d47452a2041b258e9538ef5f0.tar.gz::https://github.com/hexops/font-assets/archive/b2336a29b1ae633d47452a2041b258e9538ef5f0.tar.gz"
  "mach-objc-bb7ced86bf768979ff22254e31ed9934d74a0226.tar.gz::https://pkg.machengine.org/mach-objc/bb7ced86bf768979ff22254e31ed9934d74a0226.tar.gz"
  # "xcode-frameworks-9a45f3ac977fd25dff77e58c6de1870b6808c4a7.tar.gz::https://pkg.machengine.org/xcode-frameworks/9a45f3ac977fd25dff77e58c6de1870b6808c4a7.tar.gz"
  # "directx-headers-eae9b3b8a84a32ae9e67025fd64e8d8b7755e628.tar.gz::https://pkg.machengine.org/directx-headers/eae9b3b8a84a32ae9e67025fd64e8d8b7755e628.tar.gz"
  # "opengl-headers-d0b37fdc3b039ba5b430110545f398f0278c5396.tar.gz::https://pkg.machengine.org/opengl-headers/d0b37fdc3b039ba5b430110545f398f0278c5396.tar.gz"
  # "vulkan-zig-generated-4134f910302a71731d8d32c91cfc1bc914e6d26b.tar.gz::https://pkg.machengine.org/vulkan-zig-generated/4134f910302a71731d8d32c91cfc1bc914e6d26b.tar.gz"
  # "linux-audio-headers-81f1f13828a8b62467200ba2a0b0d911c4d089a7.tar.gz::https://pkg.machengine.org/linux-audio-headers/81f1f13828a8b62467200ba2a0b0d911c4d089a7.tar.gz"
  # "wayland-headers-7c53e7483c3cfb5c6780ae542c9f5cfa712a826a.tar.gz::https://pkg.machengine.org/wayland-headers/7c53e7483c3cfb5c6780ae542c9f5cfa712a826a.tar.gz"
  # "x11-headers-bc049ff07d31014d4d409cc328c3feb57c9b9a83.tar.gz::https://pkg.machengine.org/x11-headers/bc049ff07d31014d4d409cc328c3feb57c9b9a83.tar.gz"
  # "zigimg-48bfe6d413a5b3723a7bcf36f1fabbba30efef68.tar.gz::https://github.com/zigimg/zigimg/archive/48bfe6d413a5b3723a7bcf36f1fabbba30efef68.tar.gz"
  # "mach-opus-32712fd091636037959720ee00036a060816a4f0.tar.gz::https://pkg.machengine.org/mach-opus/32712fd091636037959720ee00036a060816a4f0.tar.gz"
  # "mach-example-assets-dbc61a1470579a7834530567011227b1e680f2af.tar.gz::https://pkg.machengine.org/mach-example-assets/dbc61a1470579a7834530567011227b1e680f2af.tar.gz"

  # freetype
  "brotli-10961426f03016e273f4f4653eae907e9e2339b6.tar.gz::https://pkg.machengine.org/brotli/10961426f03016e273f4f4653eae907e9e2339b6.tar.gz"
  # opusfile
  "opus-c15a0c4c0b7cc2028a8f953588cfafe827b8b608.tar.gz::https://pkg.machengine.org/opus/c15a0c4c0b7cc2028a8f953588cfafe827b8b608.tar.gz"
  "ogg-65a455b417485ee0cd44a6b3d4540bfc6d5771cb.tar.gz::https://pkg.machengine.org/ogg/65a455b417485ee0cd44a6b3d4540bfc6d5771cb.tar.gz"
)
noextract=("${_zig_deps[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${_zig_deps[@]}")
b2sums=('a3582817f4274c0fcfaf8c681e960b091644c16c8fb5488edbaae48e9a9a05f17f95e815fb774f83d7637e4502eaf525030142307d456f4e08622ad4d513b49c'
        'c525fe24c94c542ce31bf1c809bb82490f524d7b0fe4a2a6b63c4aa1b9824b0b58777d394176f2f9d7c57ac1afd9c15598ac392fcef89529fb96d19235a48f06'
        'f9c574e895d396b3d367865fc72ab7e574f0795d7b30994397fe57b7e2caca332c677e308985c8d0e6e51335d4e3434270edb41aad4092141ef1556980ba1bc8'
        '63bcdf9fa182009999006a121e1da581ce798a3a0c96624c58c67e688714ac83f02a44f433d496be37405cab642da82714ca4b79627b100279b6160aaf379d42'
        '38bdb8760ff82af0c35c806dbb30813db8038ce9f5e06fff2266211d00b1ab4bf892be5c64cc28ca6267d097099d63684ab45d7c9d7ecae34480376bda5ebaf9'
        'da342881614925d679c3e8956c25dacf0297c8fcf02998383704ec8591ea9ebaafd7928c88f8eb87bbe521a76423914ac41bff6939615675d0ef226bc0f65e61'
        'd9002e636e638e3fe78f5703c65ec119a99427e9cbc0a3d70291ec15672aff224e36ff931ee0de7d88b6c8707c92d69a29df890e40250eae516c4fa7b4f3c470'
        '323e8352266aa426989cce3ef5a54f2d138efa34df1701e56e1b1306fd3adde531ff36a972fe55500aee596dd0a5b9a1289b68b1c28624cff5cd5f8166626ec1'
        '3bf740f9ee54abf94e1078087e8744d31345195cd759e24ba019dd898a6272565cfcfd5221610a96a21c78d570fabaa3280cc2d50656082e1677d4060038a1b9'
        'b84f94a66e1394e4c8ba112329cde63cb988615aae95fb01082f28997ff6df7b59373b5e4c9b5ad906677707e10f14effde6a5a34189515a3934473d5301d9b3'
        '69b4cd6a509ae7141c1c5ccd78220a86bbaa37907c74fc7240ef389db235f3eebe5151740e538a75118783e364b9c825a04894f17b537494057a33b2f7618fe2'
        'f30b53a5f6457afceaa07fc15ecf17e6247dc79e4037345b57c490d3175136a17c43462eb0713861c8549c4476f7c2e762cbd0f64124ac9f447dd99be9eca169'
        '79a9d68a45918f78f900bfba4ff067f8a85cf59be33e459ccac8c065d73a1149f7b42a0e40d4e765386dbbe68bb6d4e2237d74c8d6f0caec337d9fb35777899b'
        '2931fc2ab0e0b9400fce5d8c7a28864b50e7aea3edba2f83ac66cb3bc1089368dfaa013f45088a9df72f7d6210ec449af19996726e5dc69d9184fc9632c40836'
        'af3ac05c70a91fff3df86b78937f711918d266302982ea87d850c6d3250992578053621f98608087cd22555f5d7247174759aed4351515e0654fa667aa0fe979'
        '1c20d96c26b3effbb52cc64929eddecd0d549a39d29600881761ca22ef3a9397d3ba8655aedb4dc829f80c0ac43a118a1aa49ab9a9e028096a1b451abd3b4464'
        'f6747d85d1e6239ee16761fe8f2584a741b48746ed6036dc9bac015b134f7300c6e8ecdfd49d81fb69f7c769c5d849aad7a6b836ade24aa02dcb75284980ff94'
        '54867917814938d2c4ce79f1a90937a7b2017b316c6edf327aa59938c33f1c5c00e7c07c65686f2f6d26ff168db8ff268e95a87b50d6d033ff34c6c377e27108'
        'fd8812746842085cef183d96f597cc82b48fb0ab850176a767f30e11ef229490b73ccf10f994b3cdcb3b5cb4fb74e07a5f59ea3ff7853b2cc962afa372b54383'
        'e2b0e3bc00526d05f24e102f804cd34a4539d13286389dff04d4d1df2e4e1abbd0e0f3b41573b3ec239d620167611881d6c4663fa874f80c1722d584beb8d44b'
        '084492f7c201b3030ceae327d8c973c527116925082826f1249bd8a55d96ecc6e4ed4cbed9b5823923f9b47a98f7ee0af5302c60c7d5f35374d225ca75ae52a1'
        'dec5bcfd18229d39a175bd80ad7492a8c7d94ce1891d39dd75de9bf228a0ec496e187a98b9a455565a464429dbd38641986da2034f223c5e8b9b748f3780df02'
        'e6e412265c451cb7837fe32a771af65763ef6aa658b515d7cc46dc962c48d3d4848bfb88d8a3a79dc4dde4aa60d470121afe3d336672edb2d1d777520e903abc'
        '7b4ce7a01080a68fbaf5de4e97e6aa5dc9b825ce5cdaf9db62be856c94e07fc0937987ef8f0155fbfa2c95de12701fefaa4eedbc4a23d83c9dea7c163167fba9'
        '79a9d68a45918f78f900bfba4ff067f8a85cf59be33e459ccac8c065d73a1149f7b42a0e40d4e765386dbbe68bb6d4e2237d74c8d6f0caec337d9fb35777899b'
        'ba125eff56e27a438f0ed29544d704bc321472981f3556f015f5b35403f627779bf738d506a18e85120abd8a67a7dc3fdba8e05017b0265408f9b8025ee00bc9'
        '5df6b81aaf1c96850a9043420f880410c286323cf88a26a57ef8906dfcb41b2c740571973b715ee945ff1bd3eb8b1555a0a773a4e39a1f9a720d7e2c3ae6fafb'
        'db54d134119e1361f866f8e55da5d2c60fdc16a5c25df930989a73fd5c0dc6067a20ab744fdfcac11aa281fa56e496d9c7c74fd7cc03f867f8ded895315826d6'
        '02cb967f51520b08a82d548af1cb4cd3dce631d55b8d8314ffbab64ac7000a21726f139ef6161c1f63f256ba05e388387f8093db4c253e4246cce531ee2830a5')

_srcenv(){
  export HOME="${srcdir}/fakehome"
}

prepare() {
  _srcenv

  cd "${srcdir}"
  mkdir -p "${srcdir}/fakehome"

  cd "${_pkgsrc}"
  for dep in "${_zig_deps[@]}"; do
    anyzig fetch --global-cache-dir "${srcdir}/zig-global-cache" "${srcdir}/${dep%%::*}"
  done

  # sed -i "s|assets/|/usr/share/${pkgname}/assets/|g" 'build.zig'
  # patch -Np1 -i "${srcdir}/${pkgname}_install_prefix.patch"
}

build() {
  _srcenv
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    # -Dtarget=native-linux.6.1-gnu.2.39
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}"
  gendesk -f -n \
    --name "Pixi Editor" \
    --exec "${pkgname}" \
    --icon "/opt/${pkgname}/assets/fox.png" \
    --comment "${pkgdesc}" \
    --categories "Graphics" \
    "${pkgname}"

  cd "${_pkgsrc}"
  DESTDIR="build" anyzig build "${zig_options[@]}"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  cd "${_pkgsrc}"
  # cp -va build/* "${pkgdir}"

  install -vDm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}" # "${pkgdir}/usr/share/pixmaps"
  cp -va build/usr/bin/* "${pkgdir}/opt/${pkgname}"
  ln -vsf "/opt/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${pkgname}"
  # ln -vsf "/opt/${pkgname}/assets/fox.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
