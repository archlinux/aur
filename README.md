## Synopsis

`pshash` is a pseudo-hash algorithm implemented in Haskell, that serves as a password manager by accepting three keys (one public and two private) and returning a pseudo-hash that can be used as a password. The program does not store the passwords anywhere, instead it generates them on the fly every time, which ensures a significant degree of security.

Various password templates are supported, and the user is free to define their own. These templates can then be stored in a configuration file, one template per public key. This way, the user can produce different types of passwords for different public keys, and does not have to keep all the templates inn their head.

The algorithm was designed to withstand brute-forcing as well. For finer detail, please refer to the corresponding mathematical paper: *documentation/main.pdf*

## What do I mean by 'pseudo-hash'?

Strictly speaking, a hash algorithm represents a mathematical function that is injective (i.e. does not map different inputs to the same output) and at the same time impossible to invert. This non-invertibility is usually achieved through manipulation of particular bits of the input on the low level and in an imperative way. From a purely functional approach, this is hard to realize, especially on such a high-level language as Haskell. Hence, the initial algorithm used in `pshash` to combine public and private keys into a password is a one-to-one, yet perfectly invertible function. It is then artificially made non-injective by the second private key, to "erase the traces" of the first private key. Due to its structure, this function cannot be formally called a hash function.

## Where can you generate the passwords?

First of all, you can use the algorithm online at https://thornoar.github.io/pshash/web/app/. Moreover, `pshash` adopts a wide range of local deployment options:
- You can install `pshash` from the AUR.
- You can build `pshash` with Nix flakes by invoking `nix build github:thornoar/pshash`, there are two outputs: `#dynamic` for dynamic linking, and `#static` for static linking (will take a lot longer to build).
- You can build `pshash` with `cabal-install` by cloning this repo and running `cabal update && cabal install`.
- You can simply compile the Haskell file `app/Main.hs` with `ghc`, hoping that it finds the necessary libraries.
- You can directly download the relevant pre-compiled executables from the `pshash-bin` repo: https://github.com/thornoar/pshash-bin

## Contact

You can contact me via email: `r.a.maksimovich@gmail.com`, or on Telegram/Instagram: `@thornoar`.
