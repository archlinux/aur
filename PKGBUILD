# Maintainer: taotieren <admin@taotieren.com>

pkgbase=lckfb-meta
pkgname=(lckfb-meta lckfb-taishanpi-meta)
pkgver=0.0.1
pkgrel=0
epoch=
pkgdesc="立创开发板元包 / LCKFB Development Board meta package"
arch=(x86_64
    aarch64
    riscv64)
url="https://lckfb.com/"
license=('unkown')
# groups=()
# depends=()
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
options=('!strip')
# install=
# changelog=
# source=()
# noextract=()
# sha256sums=()
#validpgpkeys=()


package_lckfb-meta() {
    pkgdesc=${pkgdesc}
    depends=(lckfb-taishanpi-meta)
}

package_lckfb-taishanpi-meta() {
    pkgdesc="立创开发板泰山派元包 / LCKFB Development Board TaishanPi meta package"
    provides=("lckfb-taishanpi")
    conflicts=("lckfb-taishanpi")
    depends=(
        # pcb
        lceda-pro

        # repo
        repo
        git
        ssh
        openssl

        # build source
        bison
        chrpath
        coreutils
        cmake
        diffstat
        dtc
        expect
        fakeroot
        flex
        gawk
        gcc
        gcc-libs
        gdb
        lz4
        make
        qemu-user-static
        qemu-user-static-binfmt
        ncurses
        patchelf
        python
        python-pip
        python-pyelftools
        tar
        texinfo
        unzip

        # build u-boot & kernel for arm64
        aarch64-linux-gnu-gcc

        # rockchip official tools
        rkbin
        rkdeveloptool
        rkflashtool

        # Third-party rockchip tools
        xrock
    )
    optdepends=(
        # Network Sharing
        samba
        # buildroot
        buildroot-meta)
}
