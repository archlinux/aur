MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem __dir__
  conf.gem github: 'eagletmt/mitamae-pacman', checksum_hash: 'v0.2.0'
  conf.gem github: 'eagletmt/mitamae-secrets', checksum_hash: 'v0.1.1'
  conf.gem github: 'ksss/mruby-at_exit', checksum_hash: '09af1ecdce7b39582023c7614f8305386ee4d789' # Latest
  conf.gem github: 'IceDragon200/mruby-catch-throw', checksum_hash: 'v1.1.0' # Latest
  conf.gem github: 'iij/mruby-dir', checksum_hash: '14bc5c3e51eac16ebc9075b7b62132a0cf5ae724' # Latest
  conf.gem github: 'gromnitsky/mruby-dir-glob', checksum_hash: '334c040a2e2c4c2689f8c3440168011f64d57ada' # Latest
  conf.gem github: 'iij/mruby-env', checksum_hash: '57f0d737a4ece49dc5b6f1c7ee09b0bc8f8adf87' # Latest
  conf.gem github: 'k0kubun/mruby-erb', checksum_hash: '978257e478633542c440c9248e8cdf33c5ad2074' # Specified by mitamae
  conf.gem github: 'iij/mruby-errno', checksum_hash: 'b4415207ff6ea62360619c89a1cff83259dc4db0' # Latest
  conf.gem github: 'eagletmt/mruby-etc', checksum_hash: 'v0.1.0' # Specified by mitamae
  conf.gem github: 'ksss/mruby-file-stat', checksum_hash: '2d3ea9b5d59d2b41133228a71c110b75cb30a31e' # Specified by mitamae
  conf.gem github: 'k0kubun/mruby-hashie', checksum_hash: 'bfdbb8aebc8786bc9e88469dae87a8dfe8ec4300' # Specified by mitamae
  conf.gem github: 'mattn/mruby-http', checksum_hash: '22d4fccd820705f6bef8e8f4989bdb4cf435f576' # Latest
  conf.gem github: 'matsumotory/mruby-httprequest', checksum_hash: '628d43dca8b9231b75cb966a471f171e735bb907' # Latest
  conf.gem github: 'iij/mruby-iijson', checksum_hash: '589c2328f29a9334d47e3c1accc1677277d323dd' # Latest
  conf.gem github: 'iij/mruby-io', checksum_hash: '6836f424c5ff95d0114a426010b22254804bc9a3' # Specified by mitamae
  conf.gem github: 'mattn/mruby-onig-regexp', checksum_hash: '973b2ac4be1532155612627050a86c1237d9a29a' # Latest
  conf.gem github: 'k0kubun/mruby-open3', checksum_hash: 'b7480b6300a81d0e5fac469a36a383518e3dfc78' # Specified by mitamae
  conf.gem github: 'fastly/mruby-optparse', checksum_hash: 'e6397a090d1efe04d5dab57c63897f0d79bbad89' # Latest
  conf.gem github: 'iij/mruby-pack', checksum_hash: '383a9c79e191d524a9a2b4107cc5043ecbf6190b' # Latest
  conf.gem github: 'luisbebop/mruby-polarssl', checksum_hash: '62c425beba695215b4191d75dcbcc16ed33b6981' # Latest
  conf.gem github: 'iij/mruby-process', checksum_hash: 'bd288a930d4f61fbda1865deb8997245dc5fd38c' # Latest
  conf.gem github: 'k0kubun/mruby-shellwords', checksum_hash: '2a284d99b2121615e43d6accdb0e4cde1868a0d8' # Specified by mitamae
  conf.gem github: 'matsumotory/mruby-simplehttp', checksum_hash: 'fc2ecd21eedcafd9bb7cad6a014d4f33c87a6196' # Latest
  conf.gem github: 'iij/mruby-socket', checksum_hash: 'fae4a589bbfca1915f7e11b18160890f1535a364' # Latest
  conf.gem github: 'k0kubun/mruby-specinfra', checksum_hash: 'd802a755cfa94675c6df80547ca553abb323ec7f' # Specified by mitamae
  conf.gem github: 'iij/mruby-tempfile', checksum_hash: 'e2f56882fab5249f5203dc8259ac2504a3221ee4' # Latest
  conf.gem github: 'zzak/mruby-uri', checksum_hash: 'e465bf687ba832cea6c9dd30db78ff6690148105' # Latest
  conf.gem github: 'hone/mruby-yaml', checksum_hash: '1cebec2eb2a7a6b8cfecc3f25967ed7eef5adab0' # Latest
end
