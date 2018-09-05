# Arch Package for [Okta AWS CLI Assume Role tool][tool]

[tool]: https://github.com/oktadeveloper/okta-aws-cli-assume-role<Paste>

## Usage

1. Install from the [AUR][]

   [aur]: https://aur.archlinux.org/packages/okta-aws-cli-assume-role/

   You can also run `makepkg -si` from within this repository.

1. Modify `~/okta/config.properties` if desired

   ```
   OKTA_ORG=
   OKTA_AWS_APP_URL=
   OKTA_STS_DURATION=
   OKTA_PROFILE=
   OKTA_PROFILE_PREFIX=
   OKTA_CREDENTIALS_SUFFIX=
   OKTA_USERNAME=
   ```

1. Run

   ```console
   okta-aws-cli-login
   ```

1. Use `aws` commands normally

   **NOTE**: Set `AWS_PROFILE` or use `--profile` with the name in step 2.

## License

Same terms as the tool itself (Apache License, Version 2.0).
