# Maintainer:  envolution
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: sukanka <su975853527[AT]gmail.com>

pkgbase="matlab-meta"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
)
pkgver=R2025b
pkgrel=2
epoch=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=('any')
url="https://www.mathworks.com/products/matlab.html"
license=('custom:None')

package_matlab-meta() {
  pkgdesc+=" (meta)"
  depends=(
    # https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps
    # Arch                  # Debian / RHEL
    'alsa-lib'              # libasound2t64
    'at-spi2-core'          # libatk-bridge2.0-0t64
                            # libatk1.0-0t64
                            # libatspi2.0-0t64
    'ca-certificates'       # ca-certificates
    # 'cairo'               # libcairo-gobject2
    #                       # libcairo2
    # 'debianutils'         # debianutils
    'fontconfig'            # libfontconfig1
    # 'fribidi'             # libfribidi0
    'gcc-libs'              # libatomic1
    'gdk-pixbuf2'           # libgdk-pixbuf-2.0-0
    'glib2'                 # libglib2.0-0t64
    'glibc'                 # libc6
    # 'glibc-locales'       # locales
    #                       # locales-all
    'gst-plugins-base-libs' # libgstreamer-plugins-base1.0-0
    'gstreamer'             # libgstreamer1.0-0
    # 'gtk3'                # libgtk-3-0t64
    # 'libcap'              # libcap2
    # 'libcups'             # libcups2t64
    'libdrm'                # libdrm2
    'libgl'                 # libgl1
    'libice'                # libice6
    # 'libltdl'             # libltdl7
    # 'libprocps'           # procps
    'libsndfile'            # libsndfile1
    # 'libtirpc'            # libtirpc3t64
    # 'libuhd'              # libuhd4.6.0-dpdk
    'libxcomposite'         # libxcomposite1
    'libxcrypt-compat'      # libcrypt1
    # 'libxcursor'          # libxcursor1
    # 'libxdamage'          # libxdamage1
    'libxfixes'             # libxfixes3
    # 'libxfont2'           # libxfont2
    'libxft'                # libxft2
    # 'libxinerama'         # libxinerama1
    'libxrandr'             # libxrandr2
    'libxt'                 # libxt6t64
    # 'libxtst'             # libxtst6
    'libxxf86vm'            # libxxf86vm1
    # 'make'                # make
    'mesa'                  # libgbm1
    # 'net-tools'           # net-tools
    'nspr'                  # libnspr4
    'nss'                   # libnss3
    # 'numactl'             # libnuma1
    # 'opa-psm2'            # libpsm2-2
    # 'openucx'             # libucx0
    'pam'                   # libpam0g
    'pango'                 # libpango-1.0-0
                            # libpangocairo-1.0-0
                            # libpangoft2-1.0-0
    'pixman'                # libpixman-1-0
    # 'rdma-core'           # ibverbs-providers
                            # libibverbs1
                            # librdmacm1t64
    # 'sudo'                # sudo
    'unzip'                 # unzip
    'util-linux-libs'       # libuuid1
    'which'                 # which.x86_64
    # 'xorg-setxkbmap'      # x11-xkb-utils
    # 'xorg-xkbcomp'
    # 'xorg-xkbevd'
    # 'xorg-xkbprint'
    # 'xorg-xkbutils'
    'wget'                  # wget
    'zlib'                  # zlib1g
  )
  optdepends=(
    "java-${pkgbase}: supported system-wide JDK"

    # https://www.mathworks.com/support/requirements/supported-compilers-linux.html
    'gcc8: supported C/C++ compiler'
    'gcc9: supported C/C++ compiler'
    'gcc10: supported C/C++ compiler'
    'gcc11: supported C/C++ compiler'
    'gcc12: supported C/C++ compiler'
    'gcc13: supported C/C++ compiler'
    'gcc10-fortran: supported Fortran compiler'

    'cairo: listed in the original depends as libcairo-gobject2, libcairo2'
    # 'debianutils: listed in the original depends as debianutils'
    'fribidi: listed in the original depends as libfribidi0'
    'glibc-locales: listed in the original depends as locales, locales-all'
    'gtk3: listed in the original depends as libgtk-3-0t64'
    'libcap: listed in the original depends as libcap2'
    'libcups: listed in the original depends as libcups2t64'
    'libltdl: listed in the original depends as libltdl7'
    'libprocps: listed in the original depends as procps'
    'libtirpc: listed in the original depends as libtirpc3t64'
    'libuhd: listed in the original depends as libuhd4.6.0-dpdk'
    'libxcursor: listed in the original depends as libxcursor1'
    'libxdamage: listed in the original depends as libxdamage1'
    'libxfont2: listed in the original depends as libxfont2'
    'libxinerama: listed in the original depends as libxinerama1'
    'libxtst: listed in the original depends as libxtst6'
    'make: listed in the original depends as make'
    'net-tools: listed in the original depends as net-tools'
    'numactl: listed in the original depends as libnuma1'
    'opa-psm2: listed in the original depends as libpsm2-2'
    'openucx: listed in the original depends as libucx0'
    'rdma-core: listed in the original depends as ibverbs-providers, libibverbs1, librdmacm1t64'
    'sudo: listed in the original depends as sudo'
    'xorg-setxkbmap: listed in the original depends as x11-xkb-utils'
    'xorg-xkbcomp: listed in the original depends as x11-xkb-utils'
    'xorg-xkbevd: listed in the original depends as x11-xkb-utils'
    'xorg-xkbprint: listed in the original depends as x11-xkb-utils'
    'xorg-xkbutils: listed in the original depends as x11-xkb-utils'
  )
}

package_java-matlab-meta() {
  pkgdesc+=" (Java components, meta)"
  depends=(
    # https://www.mathworks.com/support/requirements/openjdk.html
    'java-environment<=21'
    'java-environment>=8'
  )
}
