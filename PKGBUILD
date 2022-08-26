# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Marius Knaust <marius.knaust@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgname=('boost-git' 'boost-libs-git')
pkgver=1.80.0.r69.g1009df2416
pkgrel=1
pkgdesc='Free peer-reviewed portable C++ source libraries'
url='https://www.boost.org/'
arch=('x86_64')
license=('custom:BSL')
makedepends=('git' 'icu' 'python' 'python-numpy' 'bzip2' 'zlib' 'openmpi' 'zstd')
source=(
  'boost::git+https://github.com/boostorg/boost'
  'boost-accumulators::git+https://github.com/boostorg/accumulators'
  'boost-algorithm::git+https://github.com/boostorg/algorithm'
  'boost-align::git+https://github.com/boostorg/align'
  'boost-any::git+https://github.com/boostorg/any'
  'boost-array::git+https://github.com/boostorg/array'
  'boost-asio::git+https://github.com/boostorg/asio'
  'boost-assert::git+https://github.com/boostorg/assert'
  'boost-assign::git+https://github.com/boostorg/assign'
  'boost-atomic::git+https://github.com/boostorg/atomic'
  'boost-auto_index::git+https://github.com/boostorg/auto_index'
  'boost-bcp::git+https://github.com/boostorg/bcp'
  'boost-beast::git+https://github.com/boostorg/beast'
  'boost-bimap::git+https://github.com/boostorg/bimap'
  'boost-bind::git+https://github.com/boostorg/bind'
  'boost-boost_install::git+https://github.com/boostorg/boost_install'
  'boost-boostbook::git+https://github.com/boostorg/boostbook'
  'boost-boostdep::git+https://github.com/boostorg/boostdep'
  'boost-build::git+https://github.com/boostorg/build'
  'boost-callable_traits::git+https://github.com/boostorg/callable_traits'
  'boost-check_build::git+https://github.com/boostorg/check_build'
  'boost-chrono::git+https://github.com/boostorg/chrono'
  'boost-circular_buffer::git+https://github.com/boostorg/circular_buffer'
  'boost-cmake::git+https://github.com/boostorg/cmake'
  'boost-compatibility::git+https://github.com/boostorg/compatibility'
  'boost-compute::git+https://github.com/boostorg/compute'
  'boost-concept_check::git+https://github.com/boostorg/concept_check'
  'boost-config::git+https://github.com/boostorg/config'
  'boost-container::git+https://github.com/boostorg/container'
  'boost-container_hash::git+https://github.com/boostorg/container_hash'
  'boost-context::git+https://github.com/boostorg/context'
  'boost-contract::git+https://github.com/boostorg/contract'
  'boost-conversion::git+https://github.com/boostorg/conversion'
  'boost-convert::git+https://github.com/boostorg/convert'
  'boost-core::git+https://github.com/boostorg/core'
  'boost-coroutine2::git+https://github.com/boostorg/coroutine2'
  'boost-coroutine::git+https://github.com/boostorg/coroutine'
  'boost-crc::git+https://github.com/boostorg/crc'
  'boost-date_time::git+https://github.com/boostorg/date_time'
  'boost-describe::git+https://github.com/boostorg/describe'
  'boost-detail::git+https://github.com/boostorg/detail'
  'boost-dll::git+https://github.com/boostorg/dll'
  'boost-docca::git+https://github.com/boostorg/docca'
  'boost-dynamic_bitset::git+https://github.com/boostorg/dynamic_bitset'
  'boost-endian::git+https://github.com/boostorg/endian'
  'boost-exception::git+https://github.com/boostorg/exception'
  'boost-fiber::git+https://github.com/boostorg/fiber'
  'boost-filesystem::git+https://github.com/boostorg/filesystem'
  'boost-flyweight::git+https://github.com/boostorg/flyweight'
  'boost-foreach::git+https://github.com/boostorg/foreach'
  'boost-format::git+https://github.com/boostorg/format'
  'boost-function::git+https://github.com/boostorg/function'
  'boost-function_types::git+https://github.com/boostorg/function_types'
  'boost-functional::git+https://github.com/boostorg/functional'
  'boost-fusion::git+https://github.com/boostorg/fusion'
  'boost-geometry::git+https://github.com/boostorg/geometry'
  'boost-gil::git+https://github.com/boostorg/gil'
  'boost-graph::git+https://github.com/boostorg/graph'
  'boost-graph_parallel::git+https://github.com/boostorg/graph_parallel'
  'boost-hana::git+https://github.com/boostorg/hana'
  'boost-headers::git+https://github.com/boostorg/headers'
  'boost-heap::git+https://github.com/boostorg/heap'
  'boost-histogram::git+https://github.com/boostorg/histogram'
  'boost-hof::git+https://github.com/boostorg/hof'
  'boost-icl::git+https://github.com/boostorg/icl'
  'boost-inspect::git+https://github.com/boostorg/inspect'
  'boost-integer::git+https://github.com/boostorg/integer'
  'boost-interprocess::git+https://github.com/boostorg/interprocess'
  'boost-interval::git+https://github.com/boostorg/interval'
  'boost-intrusive::git+https://github.com/boostorg/intrusive'
  'boost-io::git+https://github.com/boostorg/io'
  'boost-iostreams::git+https://github.com/boostorg/iostreams'
  'boost-iterator::git+https://github.com/boostorg/iterator'
  'boost-json::git+https://github.com/boostorg/json'
  'boost-lambda2::git+https://github.com/boostorg/lambda2'
  'boost-lambda::git+https://github.com/boostorg/lambda'
  'boost-leaf::git+https://github.com/boostorg/leaf'
  'boost-lexical_cast::git+https://github.com/boostorg/lexical_cast'
  'boost-litre::git+https://github.com/boostorg/litre'
  'boost-local_function::git+https://github.com/boostorg/local_function'
  'boost-locale::git+https://github.com/boostorg/locale'
  'boost-lockfree::git+https://github.com/boostorg/lockfree'
  'boost-log::git+https://github.com/boostorg/log'
  'boost-logic::git+https://github.com/boostorg/logic'
  'boost-math::git+https://github.com/boostorg/math'
  'boost-metaparse::git+https://github.com/boostorg/metaparse'
  'boost-move::git+https://github.com/boostorg/move'
  'boost-mp11::git+https://github.com/boostorg/mp11'
  'boost-mpi::git+https://github.com/boostorg/mpi'
  'boost-mpl::git+https://github.com/boostorg/mpl'
  'boost-msm::git+https://github.com/boostorg/msm'
  'boost-multi_array::git+https://github.com/boostorg/multi_array'
  'boost-multi_index::git+https://github.com/boostorg/multi_index'
  'boost-multiprecision::git+https://github.com/boostorg/multiprecision'
  'boost-nowide::git+https://github.com/boostorg/nowide'
  'boost-numeric_conversion::git+https://github.com/boostorg/numeric_conversion'
  'boost-odeint::git+https://github.com/boostorg/odeint'
  'boost-optional::git+https://github.com/boostorg/optional'
  'boost-outcome::git+https://github.com/boostorg/outcome'
  'boost-parameter::git+https://github.com/boostorg/parameter'
  'boost-parameter_python::git+https://github.com/boostorg/parameter_python'
  'boost-pfr::git+https://github.com/boostorg/pfr'
  'boost-phoenix::git+https://github.com/boostorg/phoenix'
  'boost-poly_collection::git+https://github.com/boostorg/poly_collection'
  'boost-polygon::git+https://github.com/boostorg/polygon'
  'boost-pool::git+https://github.com/boostorg/pool'
  'boost-predef::git+https://github.com/boostorg/predef'
  'boost-preprocessor::git+https://github.com/boostorg/preprocessor'
  'boost-process::git+https://github.com/boostorg/process'
  'boost-program_options::git+https://github.com/boostorg/program_options'
  'boost-property_map::git+https://github.com/boostorg/property_map'
  'boost-property_map_parallel::git+https://github.com/boostorg/property_map_parallel'
  'boost-property_tree::git+https://github.com/boostorg/property_tree'
  'boost-proto::git+https://github.com/boostorg/proto'
  'boost-ptr_container::git+https://github.com/boostorg/ptr_container'
  'boost-python::git+https://github.com/boostorg/python'
  'boost-quickbook::git+https://github.com/boostorg/quickbook'
  'boost-qvm::git+https://github.com/boostorg/qvm'
  'boost-random::git+https://github.com/boostorg/random'
  'boost-range::git+https://github.com/boostorg/range'
  'boost-ratio::git+https://github.com/boostorg/ratio'
  'boost-rational::git+https://github.com/boostorg/rational'
  'boost-regex::git+https://github.com/boostorg/regex'
  'boost-safe_numerics::git+https://github.com/boostorg/safe_numerics'
  'boost-scope_exit::git+https://github.com/boostorg/scope_exit'
  'boost-serialization::git+https://github.com/boostorg/serialization'
  'boost-signals2::git+https://github.com/boostorg/signals2'
  'boost-smart_ptr::git+https://github.com/boostorg/smart_ptr'
  'boost-sort::git+https://github.com/boostorg/sort'
  'boost-spirit::git+https://github.com/boostorg/spirit'
  'boost-stacktrace::git+https://github.com/boostorg/stacktrace'
  'boost-statechart::git+https://github.com/boostorg/statechart'
  'boost-static_assert::git+https://github.com/boostorg/static_assert'
  'boost-static_string::git+https://github.com/boostorg/static_string'
  'boost-stl_interfaces::git+https://github.com/boostorg/stl_interfaces'
  'boost-system::git+https://github.com/boostorg/system'
  'boost-test::git+https://github.com/boostorg/test'
  'boost-thread::git+https://github.com/boostorg/thread'
  'boost-throw_exception::git+https://github.com/boostorg/throw_exception'
  'boost-timer::git+https://github.com/boostorg/timer'
  'boost-tokenizer::git+https://github.com/boostorg/tokenizer'
  'boost-tti::git+https://github.com/boostorg/tti'
  'boost-tuple::git+https://github.com/boostorg/tuple'
  'boost-type_erasure::git+https://github.com/boostorg/type_erasure'
  'boost-type_index::git+https://github.com/boostorg/type_index'
  'boost-type_traits::git+https://github.com/boostorg/type_traits'
  'boost-typeof::git+https://github.com/boostorg/typeof'
  'boost-ublas::git+https://github.com/boostorg/ublas'
  'boost-units::git+https://github.com/boostorg/units'
  'boost-unordered::git+https://github.com/boostorg/unordered'
  'boost-utility::git+https://github.com/boostorg/utility'
  'boost-uuid::git+https://github.com/boostorg/uuid'
  'boost-variant2::git+https://github.com/boostorg/variant2'
  'boost-variant::git+https://github.com/boostorg/variant'
  'boost-vmd::git+https://github.com/boostorg/vmd'
  'boost-wave::git+https://github.com/boostorg/wave'
  'boost-winapi::git+https://github.com/boostorg/winapi'
  'boost-xpressive::git+https://github.com/boostorg/xpressive'
  'boost-yap::git+https://github.com/boostorg/yap')
sha256sums=(
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

export _py="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"

pkgver() {
  git -C boost describe --long --tags | sed 's/^boost-//;s/-/.r/;s/-/./'
}

prepare() {
  cd boost
  git rm more
  git submodule init
  for module in \
    accumulators algorithm align any array asio assert assign atomic beast \
    bimap bind callable_traits chrono circular_buffer compatibility compute \
    concept_check config container container_hash context contract conversion \
    convert core coroutine{,2} crc date_time describe detail dll dynamic_bitset \
    endian exception fiber filesystem flyweight foreach format function \
    function_types functional fusion geometry gil graph{,_parallel} hana \
    headers heap histogram hof icl integer interprocess intrusive io iostreams \
    iterator json lambda{,2} leaf lexical_cast local_function locale lockfree \
    log logic math metaparse move mp11 mpi mpl msm multi_array multi_index \
    multiprecision nowide optional outcome parameter parameter_python pfr \
    phoenix poly_collection polygon pool predef preprocessor process program_options \
    property_map{,_parallel} property_tree proto ptr_container python qvm \
    random range ratio{,nal} regex safe_numerics scope_exit serialization \
    signals2 smart_ptr sort spirit stacktrace statechart static_{assert,string} \
    stl_interfaces system test thread throw_exception timer tokenizer tti tuple \
    type_{erasure,index,traits} typeof units unordered utility uuid variant{,2} \
    vmd wave winapi xpressive yap auto_index bcp boost_install boostbook \
    boostdep build check_build cmake docca inspect litre quickbook \
    numeric_conversion interval odeint ublas ; do
    git config submodule.$module.url "$srcdir/boost-$module"
  done
  git submodule update
}

build() {
  local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

  cd boost

  ( cd tools/build
    ./bootstrap.sh --cxxflags="$CXXFLAGS $LDFLAGS"
    ./b2 install --prefix="$srcdir/fakeinstall"
    ln -s b2 "$srcdir/fakeinstall/bin/bjam" )

  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=python3

  # Support for OpenMPI
  echo "using mpi ;" >> project-config.jam

  # boostbook is needed by quickbook
  install -dm755 "$srcdir/fakeinstall/share/boostbook"
  cp -a tools/boostbook/{xsl,dtd} "$srcdir/fakeinstall/share/boostbook/"

  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=single,multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in /usr/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.
  # install to $srcdir/fakeinstall in preparation for split packaging
  ./b2 install \
     variant=release \
     debug-symbols=off \
     threading=multi \
     runtime-link=shared \
     link=shared,static \
     toolset=gcc \
     python="$_py" \
     cflags="$CPPFLAGS $CFLAGS -fPIC -O3 -ffat-lto-objects" \
     cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3 -ffat-lto-objects" \
     linkflags="$LDFLAGS" \
     --layout=system \
     ${JOBS} \
     \
     --prefix="$srcdir/fakeinstall"
}

package_boost-git() {
  pkgdesc+=' - development headers'
  depends=("boost-libs=${pkgver}")
  optdepends=('python: for python bindings')
  provides=('boost')
  conflicts=('boost')
  options=('staticlibs')

  install -D fakeinstall/lib/*.a -t "$pkgdir/usr/lib/"
  cp -a --no-preserve=ownership fakeinstall/lib/cmake "$pkgdir/usr/lib/"
  cp -a --no-preserve=ownership fakeinstall/{bin,include,share} "$pkgdir/usr"
}

package_boost-libs-git() {
  pkgdesc+=' - runtime libraries'
  depends=('bzip2' 'zlib' 'icu' 'zstd')
  optdepends=('openmpi: for mpi support')
  provides=(libboost_atomic.so libboost_chrono.so libboost_container.so
    libboost_context.so libboost_contract.so libboost_coroutine.so
    libboost_date_time.so libboost_fiber.so libboost_filesystem.so
    libboost_graph.so libboost_graph_parallel.so libboost_iostreams.so
    libboost_locale.so libboost_log.so libboost_log_setup.so
    libboost_math_c99.so libboost_math_c99f.so libboost_math_c99l.so
    libboost_math_tr1.so libboost_math_tr1f.so libboost_math_tr1l.so
    libboost_mpi.so "libboost_numpy${_py/./}.so"
    libboost_prg_exec_monitor.so libboost_program_options.so
    "libboost_python${_py/./}.so" libboost_random.so
    libboost_regex.so libboost_serialization.so
    libboost_stacktrace_addr2line.so libboost_stacktrace_basic.so
    libboost_stacktrace_noop.so libboost_system.so libboost_thread.so
    libboost_timer.so libboost_type_erasure.so libboost_unit_test_framework.so
    libboost_wave.so libboost_wserialization.so boost-libs)
  conflicts=('boost-libs')

  install -D fakeinstall/lib/*.so* -t "$pkgdir/usr/lib/"

  # https://github.com/boostorg/mpi/issues/112
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/$_site/boost"
  touch "$pkgdir/$_site/boost/__init__.py"
  python -m compileall -o 0 -o 1 -o 2 "$pkgdir/$_site/boost"

  # https://github.com/boostorg/python/issues/203#issuecomment-391477685
  for _lib in python numpy; do
    ln -srL "${pkgdir}"/usr/lib/libboost_${_lib}${_py::1}{${_py#*.},}.so
  done

  install -Dm644 boost/LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
