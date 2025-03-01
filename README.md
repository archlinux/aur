# lifetch

the fastest way to fetch your system info!

```bash
 ~ zig build --release=fast && hyperfine --warmup 10 --runs 1000 'zig-out/bin/lifetch'
Benchmark 1: zig-out/bin/lifetch
  Time (mean ± σ):     264.4 µs ± 144.3 µs    [User: 253.7 µs, System: 492.1 µs]
  Range (min … max):     0.0 µs … 906.6 µs    1000 runs
```

## tested on

- archlinux

more to come!

## prerequisites

- [zig master](https://ziglang.org/)

i recommend installing `zig-nightly-bin` from the aur if you are on archlinux.

## config

generated inside your home directory at
`~/.config/lifetch/config.ini`

## building

```bash
zig build --release=fast
```

## running

```bash
zig build run --release=fast
```
