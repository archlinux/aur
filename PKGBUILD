# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1469.c44a0528
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils' 'tar')
provides=(c3c)
conflicts=(c3c)
source=('git+https://github.com/c3lang/c3c.git'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/clang-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libc++1-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libc++-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libc++abi1-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libc++abi-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libclang1-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libclang-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libclang-common-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_all.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libclang-cpp17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libclang-cpp17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libclang-rt-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://launchpad.net/ubuntu/+archive/primary/+files/libedit2_3.1-20221030-2_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/liblld-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/liblld-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libllvm17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libllvm-17-ocaml-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libmlir-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libmlir-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libomp-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libomp5-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/libpolly-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/lld-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/llvm-17_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/llvm-17-dev_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/llvm-17-linker-tools_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/llvm-17-runtime_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/llvm-17-tools_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
	'https://apt.llvm.org/lunar/pool/main/l/llvm-toolchain-17/mlir-17-tools_17.0.0~++20230807043917+2f40e7b2bf59-1~exp1~20230807163933.15_amd64.deb'
       )
md5sums=('SKIP'
	 '9421146600d40572bb50e145a0a1438c'
	 '0197eea4e0dc0778148202b8471fa3ae'
	 '48714c4f5b83762c369b12a775dbbee0'
	 'e13b196e028ec0976eb89152b8ac86e6'
	 '66f82f110afd3bd536d3085ed68a4a8f'
	 '3dc4963a45461374ec29055da851ba64'
	 '6a1eb78257a76ca6b9f963f9b967af45'
	 'ccd47c0c8748d2fb48b5447261a158b9'
	 'a8d79066a1aa2efb144e2bfedd502a44'
	 'ff74606abc8ac4f47951784a7119a7cb'
	 '4f9ee4531ef1a48187a6ca8be9acc6bb'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 '07e1af34c8dfd0f9bcb4fbf6129a54b0'
	 'f3b77f9c7b64a65bbb2884823b8d3043'
	 '11ee1fe323d0441e497702d6629a898d'
	 '681b92e3a979517de52819ea6ae1be50'
	 '58e513b6e7574067f18cdb4fcc2b7e16'
	 '1c86ff8ad96d5b6c498a56cd1d708a2a'
	 '9a81359b2199bde2ee9f0f2749283b4d'
	 'c6b1f2fdc01500b25df50fe1cfafd9b6'
	 'c5070e04583ca5e7f5da7401a40f9670'
	 '7b381c8b46d5369fcfc3b82a162b427b'
	 'ae405b9a710fc7ae93edffc962178841'
	 '1d53e1c8488db6eaaf5c06ae9771d743'
	 'cfb71b3722155260e53e68c7c8519ecf'
	 '2bafdfcf1fdf6b19955420699358c213'
	 '8a449e865c94a395c460105ed5441afa'
	 '4f36ed4a354b0981dfbf6b90efc98b4e'	 
	)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/"
	for i in $(/bin/ls *.deb); do
	    ar p $i data.tar.zst | tar --use-compress-program=unzstd -x ;
	done
	export LD_LIBRARY_PATH=`readlink -e usr/lib/x86_64-linux-gnu`:${LD_LIBRARY_PATH}
	export PATH=`readlink -e usr/bin`:${PATH}
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake -B build \
              -G Ninja \
              -DCMAKE_BUILD_TYPE=Debug \
              -DCMAKE_C_COMPILER=clang-17 \
              -DCMAKE_CXX_COMPILER=clang++-17 \
              -DCMAKE_LINKER=lld-link-17 \
              -DCMAKE_OBJCOPY=llvm-objcopy-17 \
              -DCMAKE_STRIP=llvm-strip-17 \
              -DCMAKE_DLLTOOL=llvm-dlltool-17 \
              -DC3_LLVM_VERSION=17

	cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/${_pkgname}"

	cp "${srcdir}/${_pkgname}/build/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
	cp -r "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
	ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE_STDLIB" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_STDLIB"
}
