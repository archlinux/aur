# HAVEGE Kernel Driver

This is a Linux kernel driver that implements the [HAVEGE](https://www.irisa.fr/caps/projects/hipsor/)
 algorithm to gather entropy from system and cache timings.

The driver implements a character device at `/dev/havege` that outputs raw binary data.

This data can then be used for reseeding the internal kernel entropy pool or for other
 purposes where random numbers are needed.

This project is licensed under the GPL. Please see the [LICENSE](LICENSE) for more information.

# Installation

There are two ways to install this driver. The first involves compiling it normally against
 the current running kernel and loading it manually.

```sh
# make all -j`nproc`
# insmod havege.ko
```

The second method involves the use of [DKMS](https://en.wikipedia.org/wiki/Dynamic_Kernel_Module_Support)
 to automatically build the driver every time the kernel is updated.

For this purpose, a [dkms.conf](dkms.conf) file was added allowing you to install this
 driver as a DKMS package. Please refer to your distribution's guide to install DKMS packages.

*N.B.* For Arch Linux users, you can simply clone this repository and run `makepkg -s` to
 build the DKMS module.

# UDEV Rule

By default, the character device implemented ( `/dev/havege` ) can only be read by the root user.

To allow the file to be read by all users, a udev rule was added. Simply copy the file to your
 rules folder before loading the kernel module to allow users to read it.

```sh
# cp 99-havege-udev.rules /etc/rules.d/99-havege-udev.rules
# modprobe havege
```

# Enhancing The Kernel Entropy Pool

For those wishing to use this driver to refill the kernel entropy pool, you must install `rng-tools`
 for your specific distribution.

After wish, direct `rngd` to use the character device provided to refill the kernel's entropy pool.

If using the service `rngd.service`, you must edit your default `rngd` configuration file.

```sh
# rngd -f -r /dev/havege
```
# Modifying Behavior

The driver comes with two parameters that may be modified to change how many times the system is
 polled for entropy during each reseeding or initial reseeding.

The initial specification uses 32 steps for both initial seeding and reseeding.

This driver uses 64 steps instead which produces throughput at roughly 30 MB/s on an
 `i7-4790` processor clocked at 3.60 GHz. Increasing these parameters will increase or decrease 
 the throughput accordingly.

You can view these parameters using `modinfo` and apply them by creating a `modprobe` rule in
 `/etc/modprobe.d/`.

# Tests

To ensure the driver works as intended, various tests were performed using well known tools.

These being the `rngtest` program, provided by `rng-tools`, `ent` and `dieharder`.

For `rngtest` and `ent`, a 25 MiB sample generated as follows:

```sh
 $ ➜  dd if=/dev/havege of=sample.bin bs=1k count=25k iflag=fullblock
```

This sample file was used for the tests as follows:

```sh
$ ent sample.bin

Entropy = 7.999993 bits per byte.

Optimum compression would reduce the size
of this 25000960 byte file by 0 percent.

Chi square distribution for 25000960 samples is 254.62, and randomly
would exceed this value 49.49 percent of the times.

Arithmetic mean value of data bytes is 127.4976 (127.5 = random).
Monte Carlo value for Pi is 3.142048168 (error 0.01 percent).
Serial correlation coefficient is -0.000219 (totally uncorrelated = 0.0).
```

```sh
 $ ➜  rngtest < sample.bin

rngtest 6.6
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

rngtest: starting FIPS tests...
rngtest: entropy source drained
rngtest: bits received from input: 200007680
rngtest: FIPS 140-2 successes: 9993
rngtest: FIPS 140-2 failures: 7
rngtest: FIPS 140-2(2001-10-10) Monobit: 1
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 5
rngtest: FIPS 140-2(2001-10-10) Long run: 1
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=1.693; avg=25.960; max=18.626)Gibits/s
rngtest: FIPS tests speed: (min=103.100; avg=218.266; max=224.394)Mibits/s
rngtest: Program run time: 881882 microseconds
```

Then `dieharder` was run with the following flags:

- `-k 2` - Run the tests using maximum precision at the cost of throughput.
- `-Y 1` - 'resolve ambiguity' (RA) mode.  If a test returns 'weak', this reruns it using a
	larger number of psamples in increments of 100 till it either fails fully or passes.
- `-a` - Runs all the tests with standard/default options

This was run directly from the character device yielding the following results:

```sh
 $ ➜ dd if=/dev/havege bs=10M iflag=fullblock | dieharder -Y 1 -k 2 -a

#=============================================================================#
#            dieharder version 3.31.1 Copyright 2003 Robert G. Brown          #
#=============================================================================#
   rng_name    |rands/second|   Seed   |
        mt19937|  1.54e+08  |4189723306|
#=============================================================================#
        test_name   |ntup| tsamples |psamples|  p-value |Assessment
#=============================================================================#
   diehard_birthdays|   0|       100|     100|0.07828562|  PASSED  
      diehard_operm5|   0|   1000000|     100|0.24618768|  PASSED  
  diehard_rank_32x32|   0|     40000|     100|0.80501063|  PASSED  
    diehard_rank_6x8|   0|    100000|     100|0.83317286|  PASSED  
   diehard_bitstream|   0|   2097152|     100|0.56375314|  PASSED  
        diehard_opso|   0|   2097152|     100|0.69228339|  PASSED  
        diehard_oqso|   0|   2097152|     100|0.72100905|  PASSED  
         diehard_dna|   0|   2097152|     100|0.79020740|  PASSED  
diehard_count_1s_str|   0|    256000|     100|0.62718998|  PASSED  
diehard_count_1s_byt|   0|    256000|     100|0.81067746|  PASSED  
 diehard_parking_lot|   0|     12000|     100|0.62905479|  PASSED  
    diehard_2dsphere|   2|      8000|     100|0.11269347|  PASSED  
    diehard_3dsphere|   3|      4000|     100|0.58435569|  PASSED  
     diehard_squeeze|   0|    100000|     100|0.69140466|  PASSED  
        diehard_sums|   0|       100|     100|0.03990886|  PASSED  
        diehard_runs|   0|    100000|     100|0.51357242|  PASSED  
        diehard_runs|   0|    100000|     100|0.52397010|  PASSED  
       diehard_craps|   0|    200000|     100|0.81900152|  PASSED  
       diehard_craps|   0|    200000|     100|0.76929002|  PASSED  
 marsaglia_tsang_gcd|   0|  10000000|     100|0.15679060|  PASSED  
 marsaglia_tsang_gcd|   0|  10000000|     100|0.40846035|  PASSED  
         sts_monobit|   1|    100000|     100|0.92019722|  PASSED  
            sts_runs|   2|    100000|     100|0.89305950|  PASSED  
          sts_serial|   1|    100000|     100|0.71650275|  PASSED  
          sts_serial|   2|    100000|     100|0.43694160|  PASSED  
          sts_serial|   3|    100000|     100|0.97264959|  PASSED  
          sts_serial|   3|    100000|     100|0.89108668|  PASSED  
          sts_serial|   4|    100000|     100|0.54264432|  PASSED  
          sts_serial|   4|    100000|     100|0.37555075|  PASSED  
          sts_serial|   5|    100000|     100|0.78949709|  PASSED  
          sts_serial|   5|    100000|     100|0.40606125|  PASSED  
          sts_serial|   6|    100000|     100|0.97969978|  PASSED  
          sts_serial|   6|    100000|     100|0.79414091|  PASSED  
          sts_serial|   7|    100000|     100|0.80494445|  PASSED  
          sts_serial|   7|    100000|     100|0.99538345|   WEAK   
          sts_serial|   8|    100000|     100|0.68028996|  PASSED  
          sts_serial|   8|    100000|     100|0.33495704|  PASSED  
          sts_serial|   9|    100000|     100|0.57681976|  PASSED  
          sts_serial|   9|    100000|     100|0.45092761|  PASSED  
          sts_serial|  10|    100000|     100|0.64251408|  PASSED  
          sts_serial|  10|    100000|     100|0.25023464|  PASSED  
          sts_serial|  11|    100000|     100|0.53638706|  PASSED  
          sts_serial|  11|    100000|     100|0.91582355|  PASSED  
          sts_serial|  12|    100000|     100|0.18660413|  PASSED  
          sts_serial|  12|    100000|     100|0.93968726|  PASSED  
          sts_serial|  13|    100000|     100|0.47663887|  PASSED  
          sts_serial|  13|    100000|     100|0.22058456|  PASSED  
          sts_serial|  14|    100000|     100|0.69650537|  PASSED  
          sts_serial|  14|    100000|     100|0.67749838|  PASSED  
          sts_serial|  15|    100000|     100|0.99327337|  PASSED  
          sts_serial|  15|    100000|     100|0.69469078|  PASSED  
          sts_serial|  16|    100000|     100|0.59125350|  PASSED  
          sts_serial|  16|    100000|     100|0.98966700|  PASSED  
          sts_serial|   1|    100000|     200|0.19601400|  PASSED  
          sts_serial|   2|    100000|     200|0.33826281|  PASSED  
          sts_serial|   3|    100000|     200|0.22209718|  PASSED  
          sts_serial|   3|    100000|     200|0.83091121|  PASSED  
          sts_serial|   4|    100000|     200|0.12860004|  PASSED  
          sts_serial|   4|    100000|     200|0.97207073|  PASSED  
          sts_serial|   5|    100000|     200|0.11692114|  PASSED  
          sts_serial|   5|    100000|     200|0.26192745|  PASSED  
          sts_serial|   6|    100000|     200|0.47520472|  PASSED  
          sts_serial|   6|    100000|     200|0.97632585|  PASSED  
          sts_serial|   7|    100000|     200|0.86177050|  PASSED  
          sts_serial|   7|    100000|     200|0.73921982|  PASSED  
          sts_serial|   8|    100000|     200|0.66482804|  PASSED  
          sts_serial|   8|    100000|     200|0.75521757|  PASSED  
          sts_serial|   9|    100000|     200|0.86263171|  PASSED  
          sts_serial|   9|    100000|     200|0.34619180|  PASSED  
          sts_serial|  10|    100000|     200|0.98828662|  PASSED  
          sts_serial|  10|    100000|     200|0.63457556|  PASSED  
          sts_serial|  11|    100000|     200|0.56678030|  PASSED  
          sts_serial|  11|    100000|     200|0.69667576|  PASSED  
          sts_serial|  12|    100000|     200|0.73423841|  PASSED  
          sts_serial|  12|    100000|     200|0.67862680|  PASSED  
          sts_serial|  13|    100000|     200|0.70115984|  PASSED  
          sts_serial|  13|    100000|     200|0.23922799|  PASSED  
          sts_serial|  14|    100000|     200|0.98543778|  PASSED  
          sts_serial|  14|    100000|     200|0.50529911|  PASSED  
          sts_serial|  15|    100000|     200|0.36004982|  PASSED  
          sts_serial|  15|    100000|     200|0.17283932|  PASSED  
          sts_serial|  16|    100000|     200|0.53274108|  PASSED  
          sts_serial|  16|    100000|     200|0.56658655|  PASSED  
         rgb_bitdist|   1|    100000|     100|0.80659811|  PASSED  
         rgb_bitdist|   2|    100000|     100|0.77944380|  PASSED  
         rgb_bitdist|   3|    100000|     100|0.66530230|  PASSED  
         rgb_bitdist|   4|    100000|     100|0.13074912|  PASSED  
         rgb_bitdist|   5|    100000|     100|0.10877526|  PASSED  
         rgb_bitdist|   6|    100000|     100|0.86446353|  PASSED  
         rgb_bitdist|   7|    100000|     100|0.98502972|  PASSED  
         rgb_bitdist|   8|    100000|     100|0.71678227|  PASSED  
         rgb_bitdist|   9|    100000|     100|0.63339078|  PASSED  
         rgb_bitdist|  10|    100000|     100|0.83608462|  PASSED  
         rgb_bitdist|  11|    100000|     100|0.15566276|  PASSED  
         rgb_bitdist|  12|    100000|     100|0.52103141|  PASSED  
rgb_minimum_distance|   2|     10000|    1000|0.87156380|  PASSED  
rgb_minimum_distance|   3|     10000|    1000|0.79089173|  PASSED  
rgb_minimum_distance|   4|     10000|    1000|0.22133014|  PASSED  
rgb_minimum_distance|   5|     10000|    1000|0.30816676|  PASSED  
    rgb_permutations|   2|    100000|     100|0.70997391|  PASSED  
    rgb_permutations|   3|    100000|     100|0.16735842|  PASSED  
    rgb_permutations|   4|    100000|     100|0.74315136|  PASSED  
    rgb_permutations|   5|    100000|     100|0.99564663|   WEAK   
    rgb_permutations|   5|    100000|     200|0.73122983|  PASSED  
      rgb_lagged_sum|   0|   1000000|     100|0.14206609|  PASSED  
      rgb_lagged_sum|   1|   1000000|     100|0.76954863|  PASSED  
      rgb_lagged_sum|   2|   1000000|     100|0.80043208|  PASSED  
      rgb_lagged_sum|   3|   1000000|     100|0.45648849|  PASSED  
      rgb_lagged_sum|   4|   1000000|     100|0.90035262|  PASSED  
      rgb_lagged_sum|   5|   1000000|     100|0.46099924|  PASSED  
      rgb_lagged_sum|   6|   1000000|     100|0.17885043|  PASSED  
      rgb_lagged_sum|   7|   1000000|     100|0.93997311|  PASSED  
      rgb_lagged_sum|   8|   1000000|     100|0.26356022|  PASSED  
      rgb_lagged_sum|   9|   1000000|     100|0.25486242|  PASSED  
      rgb_lagged_sum|  10|   1000000|     100|0.95460356|  PASSED  
      rgb_lagged_sum|  11|   1000000|     100|0.24742445|  PASSED  
      rgb_lagged_sum|  12|   1000000|     100|0.47326246|  PASSED  
      rgb_lagged_sum|  13|   1000000|     100|0.18139624|  PASSED  
      rgb_lagged_sum|  14|   1000000|     100|0.24961440|  PASSED  
      rgb_lagged_sum|  15|   1000000|     100|0.60006813|  PASSED  
      rgb_lagged_sum|  16|   1000000|     100|0.95799649|  PASSED  
      rgb_lagged_sum|  17|   1000000|     100|0.25125998|  PASSED  
      rgb_lagged_sum|  18|   1000000|     100|0.27818535|  PASSED  
      rgb_lagged_sum|  19|   1000000|     100|0.76062551|  PASSED  
      rgb_lagged_sum|  20|   1000000|     100|0.09752780|  PASSED  
      rgb_lagged_sum|  21|   1000000|     100|0.62887918|  PASSED  
      rgb_lagged_sum|  22|   1000000|     100|0.89325033|  PASSED  
      rgb_lagged_sum|  23|   1000000|     100|0.52161424|  PASSED  
      rgb_lagged_sum|  24|   1000000|     100|0.82893665|  PASSED  
      rgb_lagged_sum|  25|   1000000|     100|0.62524900|  PASSED  
      rgb_lagged_sum|  26|   1000000|     100|0.12340213|  PASSED  
      rgb_lagged_sum|  27|   1000000|     100|0.18904618|  PASSED  
      rgb_lagged_sum|  28|   1000000|     100|0.91897446|  PASSED  
      rgb_lagged_sum|  29|   1000000|     100|0.08619284|  PASSED  
      rgb_lagged_sum|  30|   1000000|     100|0.34386569|  PASSED  
      rgb_lagged_sum|  31|   1000000|     100|0.78404592|  PASSED  
      rgb_lagged_sum|  32|   1000000|     100|0.83746391|  PASSED  
     rgb_kstest_test|   0|     10000|    1000|0.21168760|  PASSED  
     dab_bytedistrib|   0|  51200000|       1|0.41140405|  PASSED  
             dab_dct| 256|     50000|       1|0.30160704|  PASSED  
        dab_filltree|  32|  15000000|       1|0.58112590|  PASSED  
        dab_filltree|  32|  15000000|       1|0.32213300|  PASSED  
       dab_filltree2|   0|   5000000|       1|0.77375471|  PASSED  
       dab_filltree2|   1|   5000000|       1|0.24311552|  PASSED  
        dab_monobit2|  12|  65000000|       1|0.75745817|  PASSED 
```