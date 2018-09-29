# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ejabberd-current
pkgver=18.09
pkgrel=0
pkgdesc="Jabber server written in Erlang"
arch=('x86_64')
url="http://www.ejabberd.im/"
license=("GPL")
depends=('expat' 'openssl' 'zlib' 'erlang-nox' 'pam' 'iproute2' 'erlang-unixodbc'
	 'libyaml' 'sqlite' 'gd')
makedepends=('git' 'rebar' 'hevea' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
backup=('etc/ejabberd/ejabberd.yml'
	'etc/ejabberd/ejabberdctl.cfg'
	'etc/logrotate.d/ejabberd')
conflicts=('ejabberd')
options=(emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/processone/ejabberd/archive/$pkgver.tar.gz"
	"base64url::git://github.com/dvv/base64url.git#commit=f2c64ed8b9bebc536fad37ad97243452b674b837"
	"cache_tab::git://github.com/processone/cache_tab#commit=204bdd6c1b95b7bdddaa8b7f30ff43b57620b586"
	"eimp::git://github.com/processone/eimp#commit=d16fd3f050bd1114d72bacbf2029dc6dd5b31da0"
	"elixir::git://github.com/elixir-lang/elixir#commit=867da6f876c48279823a41a33030c95ef37379b2"
	"epam::git://github.com/processone/epam#commit=c4940ad96c9e734865d54df45af6f90c1c4ce03b"
	"eredis::git://github.com/wooga/eredis#commit=cbc013f516e464706493c01662e5e9dd82d1db01"
	"esip::git://github.com/processone/esip#commit=89fc10d749b2a205a2a099b10f886018dd2c053f"
	"ezlib::git://github.com/processone/ezlib#commit=ccfb3b25c6476894c3e8d835d35ff258f64e9e14"
	"fast_tls::git://github.com/processone/fast_tls#commit=6ec157bcbcb016bb32f7e568094ab22498b56c70"
	"fast_xml::git://github.com/processone/fast_xml#commit=0e5b0b3d6f1a83f646fa4e01fddda71c3f8f3b8d"
	"fast_yaml::git://github.com/processone/fast_yaml#commit=697dc776316c4ad48a5a962cf8af13230cb9c1f9"
	"goldrush::git://github.com/DeadZen/goldrush.git#commit=8f1b715d36b650ec1e1f5612c00e28af6ab0de82"
	"hamcrest::git://github.com/basho/hamcrest-erlang.git#commit=ad3dbab419762fc2d5821abb88b989da006b85c6"
	"iconv::git://github.com/processone/iconv#commit=819125883241205ec196d7965a41594f680bc950"
	"jiffy::git://github.com/davisp/jiffy#commit=1febce3ca86c5ca5d5a3618ed3d5f125bb99e4c5"
	"jose::git://github.com/potatosalad/erlang-jose#commit=f8f97fb651202386c951fccfcb61d123518ba05f"
	"lager::git://github.com/erlang-lager/lager#commit=a10c23c51dea6bbd63e5048c8a5a702169973114"
	"luerl::git://github.com/rvirding/luerl#commit=01fa43a1a5d68becfe07236a9a71505039474108"
	"meck::git://github.com/eproxus/meck#commit=70d6a33ce7407029dc59e22a5b3c1c61c1348b23"
	"moka::git://github.com/processone/moka#commit=6b1ead5821423fa5d465795f99f59f211e708583"
	"p1_mysql::git://github.com/processone/p1_mysql#commit=272f0b4e72b13103dfdef56e370c00a4de882adf"
	"p1_oauth2::git://github.com/processone/p1_oauth2#commit=ab44e27db49021321e1a5d4dcf65c6c65c088075"
	"p1_pgsql::git://github.com/processone/p1_pgsql#commit=df6f8819eb46a8c490ba95b1fda66347970111dc"
	"p1_utils::git://github.com/processone/p1_utils#commit=87336780d6d2b5985aba5b2136903d26d6e26ac0"
	"rebar_elixir_plugin::git://github.com/processone/rebar_elixir_plugin#commit=10614dfef5d10b7071f7181858149259e50159f6"
	"riakc::git://github.com/processone/riak-erlang-client#commit=63db9859cf478cc67d4149940a5a9eae8c5ca3bc"
	"riak_pb::git://github.com/basho/riak_pb#commit=08771aba2ce4935b715d32d1b92555efdc3da994"
	"samerlib::git://github.com/processone/samerlib#commit=61fdc411c0aa902d63d73ca3410a8d8afcd39283"
	"sqlite3::git://github.com/processone/erlang-sqlite3#commit=cedc45a668d7630f942cab1c6f695de14b097e05"
	"stringprep::git://github.com/processone/stringprep#commit=57e434f92720fcd448f2318bbda10450cb79c2ca"
	"stun::git://github.com/processone/stun#commit=b5987b787d79dee6b501e209fd5cd61e03d2d6e7"
	"xmpp::git://github.com/processone/xmpp#commit=0f8042e5d10c325e0043b1c22ba9557888266258"
	"$pkgname.logrotate"
	"ejabberd.service"
	"sysuser.conf")
sha256sums=('85c57ba9784f7346f94236c3d1b1dae676f5bb2ee65c6d2204fb4bbcd7582769'
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
            'SKIP'
            'SKIP'
            '31780cac78736d285e46f445f8c8463a70f2aeb2683280c259129db11832ddd2'
            '94582b1df76f6d86abfcc78bf4c4ac79276761c75483dd40a45b7ff2b19dc8a8'
            '68de8fd4df6e4f0e21a241dcd2b7075bdff495876646dd726c7054bf5780e3c6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$srcdir/$pkgname-$pkgver/deps"
  for i in \
    base64url cache_tab eimp elixir epam eredis esip ezlib fast_tls fast_xml fast_yaml goldrush hamcrest iconv jiffy jose lager luerl meck moka p1_mysql p1_oauth2 p1_pgsql p1_utils rebar_elixir_plugin riakc riak_pb samerlib sqlite3 stringprep stun xmpp \
    ; do
    rm -rf "$srcdir/$pkgname-$pkgver/deps/$i"
    mv "$srcdir"/$i "$srcdir/$pkgname-$pkgver/deps"
  done

  sed -i "s|git describe --tags 2>/dev/null|echo $pkgver|" configure.ac
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [ -x configure ] || ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-all
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm04750 deps/epam/priv/bin/epam "$pkgdir"/usr/lib/ejabberd-$pkgver/priv/bin/epam
  install -d "$pkgdir/var/lib/$pkgname"
  install -D -m0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
  chmod ug+r "$pkgdir/etc/$pkgname/"*
  chmod a+rx "$pkgdir/usr/bin/ejabberdctl" "$pkgdir/usr/lib/ejabberd-$pkgver/priv/bin/captcha.sh"
  rm -rf "$pkgdir/var/lock"
  install -Dm0644 "$srcdir"/ejabberd.service "$pkgdir"/usr/lib/systemd/system/ejabberd.service
  install -Dm644 "$srcdir"/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/ejabberd.conf
  install -Dm644 tools/ejabberdctl.bc "$pkgdir"/usr/share/bash-completion/completions/ejabberdctl

  # workaround
  ln -s mod_configure.beam "$pkgdir"/usr/lib/ejabberd-$pkgver/ebin/configure.beam
  rm -f "$pkgdir"/usr/bin/{elixir,iex,mix}

  echo -e "\n\n# home dir workaround\nHOME=/var/lib/ejabberd" >>"$pkgdir"/etc/ejabberd/ejabberdctl.cfg

  # /usr/lib/ejabberd symlink follows to ejabberd version
  ln -s ejabberd-$pkgver "$pkgdir"/usr/lib/ejabberd

  # permissions
  chown -R 17:17 "$pkgdir"/var/{lib,log}/ejabberd
  chown root:17 \
    "$pkgdir"/etc/ejabberd/ejabberd.yml \
    "$pkgdir"/etc/ejabberd/ejabberdctl.cfg \
    "$pkgdir"/etc/ejabberd \
    "$pkgdir"/usr/lib/ejabberd/priv/bin/epam

  # fix eimp
  chmod a+x "$pkgdir"/usr/lib/eimp-*/priv/bin/eimp
}

# vim:set ts=2 sw=2 et:
