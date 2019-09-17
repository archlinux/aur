# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# adapted from last v3 build of community/electron

_chromiumver=66.0.3359.181
pkgname=electron3
pkgver=3.1.13
pkgrel=1
pkgdesc='Build cross platform desktop apps with web technologies'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss'
         'minizip' 'nss' 'snappy')
makedepends=('clang' 'git' 'gn' 'gperf' 'harfbuzz-icu' 'jsoncpp' 'libnotify'
             'lld' 'llvm' 'ninja' 'npm' 'pciutils' 'python2' 'wget' 'yasm')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=("git+https://github.com/electron/electron.git#tag=v${pkgver}"
        'git+https://github.com/boto/boto.git'
        'breakpad::git+https://github.com/electron/chromium-breakpad.git'
        'git+https://chromium.googlesource.com/chromium/src/tools/grit.git'
        'git+https://github.com/electron/gyp.git'
        "git+https://github.com/electron/libchromiumcontent.git"
        'git+https://github.com/electron/node.git'
        'pdf_viewer::git+https://github.com/electron/pdf-viewer.git'
        'git+https://github.com/yaml/pyyaml.git'
        'git+https://github.com/kennethreitz/requests.git'
        'google-breakpad::git+https://chromium.googlesource.com/breakpad/breakpad/src'
        "electron-chromium-${_chromiumver}.tar.bz2::https://s3.amazonaws.com/github-janky-artifacts/libchromiumcontent/linux/src/${_chromiumver}/src.tar.bz2"
        'electron3.desktop'
        'default_app-icon.patch'
        'dont-bootstrap-libchromiumcontent.patch'
        'dont-update-submodules.patch'
        'dont-use-sysroot.patch'
        'no-clang-plugins.patch'
        'no-whole-archive.patch'
        'use-system-libraries-in-node.patch'
        'use-system-ffmpeg.patch'
        'breakpad-glibc2.26.patch'
        'gyp-no-rpath.patch'
        'libchromiumcontent-remove-useless-patches.patch'
        'libchromiumcontent-settings.patch'
        'libchromiumcontent-sort-filenames.patch'
        'libchromiumcontent-static-library-only.patch'
        'libchromiumcontent-use-system-tools.patch'
        'chromium-use-system-ffmpeg.patch'
        'chromium-use-system-re2.patch'
       )
noextract=("electron-chromium-${_chromiumver}.tar.bz2")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '64e3c617aba3af71213e8e36af38a39934f1f5c7eea53b2c09d9d9ac189397d8f3e95196f47552fbde83d9e062fb38f5ca48b6791caf5db42663b8a969cb7394'
            '418b9f1c796bb8b9276afc44975988ae8ebc8a31420a08303c9fcf0fa9628f1bafa128542c07c39274346f7391acad9d2e167be043eca742ce8b07c01b0f4e66'
            '7644e4cb173cb66d83cfc121b6eb9696d4b60ea119230e767aa17bb438c35a94b2d8fddd1369ebe052905c8c85765e927adb540a5c2310b4a2e9bb546597c4e6'
            '144bc8f7ad1ec1c99d59f4a8db375d786f3e4d042d295e860397c76b80e0deaeb4a931fb0e19f30ee1fe192f597f046e7716af6f7795320d5573a7b30c461d3d'
            'b660afcc9a61527e6f532d12905ed65175c226ff46b23bc3fdb79b37f73c6961722887042c01ccddebefb0ec249206979506e12e78bbe468fd648b9d34094db9'
            'e18f210dc4c225038c8093685bc9eb5cb957f7c1fd38998bd475ed15a771595738d72183adecc6434896b410b0692e6cadda0dbd5e99b6123e92443341bcb042'
            'b1884d78d37b4c2690546c681a1b485539b2b9af928e8177192c08bf5985c08481ca4d75a4f2f5e8f0a6b73776df851835e32913bd77a2dcc2586a9efb1f8d63'
            '7f48da3c06155bd15bc938ce4ae8f95185dc8b51d924602d8b905db25083aba3fe1d095c087eeff11a274aa21874a0c986add52bcac7a5c0c40b62c91c60bdfa'
            '9b2d16d51d092901db8738ad4a520a6a06b42326201866069dcd2ae5b7a393cc7097d0eef752866a11072c61ab7a1dc60c175e8c60aa600d88088dff6f8e29f1'
            '4e77ccd0aefe8bb0885cea88ceb5ef362e7838677c622427510027cd9866180345b7aa55be7dcacf61a28ba5b609cccb5c5fc3ca407f6ebf7ac21f5d43027575'
            '2dd594a07f8ce62a7706a0365d764ab3ee3cc2d050d6ae4460db3152269e84f43516438a4f48f47fc54fe758a70c462baed6b7defa8b2bd277e67cb1bae8da12'
            'd77a2045f03c1327eb78517028c083e8965297a41d5a81df8c7dac5a8500aa242faa644a38be5d12914b68ba3a0b944c1bfe6dbfd7b88b1a0aeeec1d87a1619a'
            '3941928af296d14e82232824aebb2a3eaddba4211c4d383f2c98d2394500ddd5847e2efd4044c1d4bdbb44d145d55aab5d5b111381305398bbf356bdfc9ee10c'
            '9e1eea0ae01852a32ff3c391156da04fe8abba632890a3a5599471f415c84ac7d8ffdc5cf1317dcd7a17c043d4658267a9c9504dcd9f27168b1239a69c659995'
            '5e14b4bff2746b7aaf6c6f53fb69949e51d999402c47b6f957cc87466b06867aef10471ad28e750401f1882c9225b8d42c61d57c71b536e215e9db69a52207d5'
            'cde43f9479cbb572abf6214ed448b0074feb3b0f8ba69c12ab929d1ac81ccd192cb7b9878d14fa65cebdc2d63bceecd4369678dbd27ee3ca557f6b8c2b1f2af7'
            '16418d54549e605cc55dbcc0efab4dbe01c62f85604c552a641dd83de961d42d7843c72831e29f98f3f5fb173c73a6feee5300dcb8a19388d71a481167d3f4a9'
            'c186d1e76f68f412779b8ccac2a6ea84614b73e51d27cfdfcba6e0be04cb009a9f4e04e1dca03a0c5a5aa34656e52c980288f4985a4cacefc874ab27e55f62c3'
            '5552e8918462f6c3a4e1baef3c22b57d70c732766945ea0b39f63df7d7b8fca9646f1f9b28b0528fa586799842c949298fc97e1041875da0ca1aacff046f6c9b')

_system_libs=('ffmpeg'
              'flac'
              'harfbuzz-ng'
#              'icu'
              'libevent'
              'libjpeg'
#              'libpng'
#              'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
#              're2'
              'snappy'
              'yasm'
              'zlib'
             )

prepare() {
  cd "${srcdir}"/electron

  patch -Np1 -i "${srcdir}"/default_app-icon.patch  # Icon from .desktop file
  patch -Np1 -i "${srcdir}"/use-system-libraries-in-node.patch
  patch -Np1 -i "${srcdir}"/use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/dont-update-submodules.patch
  patch -Np1 -i "${srcdir}"/dont-use-sysroot.patch
  patch -Np1 -i "${srcdir}"/dont-bootstrap-libchromiumcontent.patch
  patch -Np1 -i "${srcdir}"/no-clang-plugins.patch
  patch -Np1 -i "${srcdir}"/no-whole-archive.patch

  # Add extra libraries for unbundling, remove unneeded libraries
  sed -e "s/'-lexpat',/'-lexpat', '<\!@(pkg-config --libs-only-l libavcodec libavformat libavutil libevent flac harfbuzz-icu libjpeg jsoncpp minizip libpulse snappy libwebpdemux libwebpmux libxml-2.0 libxslt zlib)', '-latomic',/" \
      -e 's/ gconf-2.0//' \
      -i brightray/brightray.gyp

  mkdir -p "${srcdir}"/python2-path
  ln -sf /usr/bin/python2 "${srcdir}/python2-path/python"

  for m in boto breakpad gyp libchromiumcontent node pdf_viewer requests; do
    git submodule init vendor/${m}
    git config submodule.vendor/${m}.url "${srcdir}/${m}"
  done
  git submodule update

  cd "${srcdir}"/electron/vendor/pdf_viewer
  git submodule init vendor/grit
  git config submodule.vendor/grit.url "${srcdir}/grit"
  git submodule update

  cd "${srcdir}"/electron/vendor/breakpad
  git submodule init src
  git config submodule.src.url "${srcdir}"/google-breakpad
  git submodule update
  patch -Np1 -i "${srcdir}"/breakpad-glibc2.26.patch

  cd "${srcdir}"/electron/vendor/gyp
  # Remove a useless $ORIGIN/lib/ rpath from the electron binary
  patch -Np1 -i "${srcdir}"/gyp-no-rpath.patch

  cd "${srcdir}"/electron/vendor/libchromiumcontent
  for m in pyyaml; do
    git submodule init vendor/${m}
    git config submodule.vendor/${m}.url "${srcdir}/${m}"
  done
  git submodule update
  patch -Np1 -i "${srcdir}"/libchromiumcontent-remove-useless-patches.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-settings.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-sort-filenames.patch  # deterministic build
  patch -Np1 -i "${srcdir}"/libchromiumcontent-use-system-tools.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-static-library-only.patch
  rm -r patches/common/ffmpeg  # Use system FFmpeg
  echo 'Extracting chromium source...'
  tar -xf "${srcdir}"/electron-chromium-${_chromiumver}.tar.bz2
  cd src
  patch -Np1 -i "${srcdir}"/chromium-use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/chromium-use-system-re2.patch

  for lib in "${_system_libs[@]}" libjpeg_turbo; do
      find -type f -path "*third_party/${lib}/*" \
          \! -path "*third_party/${lib}/chromium/*" \
          \! -path "*third_party/${lib}/google/*" \
          \! -path "*base/third_party/icu/*" \
          \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py --system-libraries "${_system_libs[@]}"

  # Create sysmlink to system Node.js
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node third_party/node/linux/node-linux-x64/bin
}

build() {
  export PATH="${srcdir}/python2-path:${PATH}"
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  cd "${srcdir}/electron/vendor/libchromiumcontent"
  script/update -t x64 --skip_gclient
  script/build -t x64 -c static_library
  script/create-dist -c static_library --no_zip -t x64

  cd "${srcdir}"/electron
  LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  distdir="${srcdir}/electron/vendor/libchromiumcontent/dist/main"
  script/bootstrap.py --verbose \
                      --clang_dir=/usr \
                      --libcc_source_path="${distdir}/src" \
                      --libcc_shared_library_path="${distdir}/shared_library" \
                      --libcc_static_library_path="${distdir}/static_library"
  script/build.py -c Release --ninja-path=ninja
}

package() {
  cd "${srcdir}"/electron

  _cc="${srcdir}"/electron/vendor/libchromiumcontent/dist/main

  install -d -m755 "${pkgdir}"/usr/share/licenses/electron3
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/electron3
  install -m644 LICENSE "${_cc}"/LICENSES.chromium.html \
          "${pkgdir}"/usr/share/licenses/electron3
  install -m644 native_mate/LICENSE.chromium \
          "${pkgdir}"/usr/share/licenses/electron3/LICENSE-native_mate
  install -m644 vendor/node/LICENSE \
          "${pkgdir}"/usr/share/licenses/electron3/LICENSE-node
  install -m644 vendor/libchromiumcontent/LICENSE.txt \
          "${pkgdir}"/usr/share/licenses/electron3/LICENSE-libchromiumcontent
  install -m644 vendor/libchromiumcontent/src/LICENSE \
          "${pkgdir}"/usr/share/licenses/electron3/LICENSE-chromium

  cd out/R
  install -d -m755 "${pkgdir}"/usr/lib/electron3
  install -m644 blink_image_resources_200_percent.pak \
          content_resources_200_percent.pak content_shell.pak icudtl.dat \
          natives_blob.bin \
          ui_resources_200_percent.pak \
          v8_context_snapshot.bin \
          views_resources_200_percent.pak \
          "${pkgdir}"/usr/lib/electron3
  install -m755 electron "${pkgdir}"/usr/lib/electron3
  install -dm755 "${pkgdir}"/usr/bin
  ln -s ../lib/electron3/electron "${pkgdir}"/usr/bin/electron3
  # namcap warning: Referenced library 'libnode.so' is an uninstalled dependency
  # Fixable by moving libnode.so to /usr/lib
  install -m644 libnode.so "${pkgdir}"/usr/lib/electron3
  cp -r locales resources "${pkgdir}"/usr/lib/electron3
  cd ../..

  echo -n "v${pkgver}" > "${pkgdir}"/usr/lib/electron3/version

  # Install .desktop and icon file
  install -Dm644 "${srcdir}"/electron3.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm644 default_app/icon.png \
          "${pkgdir}"/usr/share/pixmaps/electron3.png  # hicolor has no 1024x1024

  # Install Node headers
  _headers_dest="${pkgdir}/usr/lib/electron3/node"
  install -d -m755 "${_headers_dest}"
  cd "${srcdir}"/electron/vendor/node
  find src deps/http_parser deps/zlib deps/uv deps/npm \
    -name "*.gypi" \
      -exec install -D -m644 '{}' "${_headers_dest}/{}" \; \
    -or -name "*.h" \
      -exec install -D -m644 '{}' "${_headers_dest}/{}" \;
  install -m644 {common,config}.gypi "${_headers_dest}"
  cd "${_cc}"/src
  find v8 -name "*.h" \
    -exec install -D -m644 '{}' "${_headers_dest}/deps/{}" \;
  # echo '9' > "${_headers_dest}/installVersion"
}
