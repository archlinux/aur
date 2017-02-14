MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem __dir__
  conf.gem github: 'eagletmt/mitamae-pacman', checksum_hash: 'v0.2.0'
  conf.gem github: 'eagletmt/mitamae-secrets', checksum_hash: 'v0.1.1'
  conf.gem github: 'IceDragon200/mruby-catch-throw', checksum_hash: 'v1.1.0' # Latest
  conf.gem github: 'iij/mruby-dir', checksum_hash: '14bc5c3e51eac16ebc9075b7b62132a0cf5ae724' # Latest
  conf.gem github: 'gromnitsky/mruby-dir-glob', checksum_hash: '334c040a2e2c4c2689f8c3440168011f64d57ada' # Latest
  conf.gem github: 'iij/mruby-env', checksum_hash: '57f0d737a4ece49dc5b6f1c7ee09b0bc8f8adf87' # Latest
  conf.gem github: 'k0kubun/mruby-erb', checksum_hash: '978257e478633542c440c9248e8cdf33c5ad2074' # Specified by mitamae
  conf.gem github: 'iij/mruby-errno', checksum_hash: 'b4415207ff6ea62360619c89a1cff83259dc4db0' # Latest
  conf.gem github: 'eagletmt/mruby-etc', checksum_hash: 'v0.1.0' # Specified by mitamae
  conf.gem github: 'ksss/mruby-file-stat', checksum_hash: '2d3ea9b5d59d2b41133228a71c110b75cb30a31e' # Latest
  conf.gem github: 'k0kubun/mruby-hashie', checksum_hash: 'bfdbb8aebc8786bc9e88469dae87a8dfe8ec4300' # Specified by mitamae
  conf.gem github: 'mattn/mruby-http', checksum_hash: '22d4fccd820705f6bef8e8f4989bdb4cf435f576' # Latest
  conf.gem github: 'matsumotory/mruby-httprequest', checksum_hash: '9a0b6a0a2e5918b60501af412163000e3db83c58' # Latest
  conf.gem github: 'iij/mruby-iijson', checksum_hash: '2472d063fce158249862b43bf51a84aec63336c7' # Latest
  conf.gem github: 'iij/mruby-io', checksum_hash: '86d58a2d3727f556e6e6ce10d170b6170911a263' # Specified by mitamae
  conf.gem github: 'mattn/mruby-onig-regexp', checksum_hash: '12f573cb327aa50834c3a549f62995f44edd3172' # Latest
  conf.gem github: 'k0kubun/mruby-open3', checksum_hash: '211550775492e68ba217526808cf1df9deb7fa5a' # Specified by mitamae
  conf.gem github: 'fastly/mruby-optparse', checksum_hash: 'e6397a090d1efe04d5dab57c63897f0d79bbad89' # Latest
  conf.gem github: 'iij/mruby-pack', checksum_hash: '88a7fedea413568a1ff0410e109ff55a03b63a5f' # Latest
  conf.gem github: 'iij/mruby-process', checksum_hash: '7308e8f4737cb33e3a3d92e60169983a6ebddd08' # Latest
  conf.gem github: 'k0kubun/mruby-shellwords', checksum_hash: '2a284d99b2121615e43d6accdb0e4cde1868a0d8' # Specified by mitamae
  conf.gem github: 'matsumotory/mruby-simplehttp', checksum_hash: '4b90c1de9b80d6229f48e4af6967d2f38c31094b' # Latest
  conf.gem github: 'iij/mruby-socket', checksum_hash: '3dad125a1cd93e70a1762e9c6a1d5e01554ad71c' # Latest
  conf.gem github: 'k0kubun/mruby-specinfra', checksum_hash: '4132571dec892ba4962f98766ee891e8466e3a47' # Specified by mitamae
  conf.gem github: 'iij/mruby-tempfile', checksum_hash: '48073012c932f540dc3773b2dc6b079caf71a70d' # Latest
  conf.gem github: 'hone/mruby-yaml', checksum_hash: 'dd34566926a6f90667983052efc40143427fea49' # Latest
end
