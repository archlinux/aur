## Relevant flags for backend:
## - demo-users
## - email-verification
## - log-emails
## - log-invitation-tokens
## - login-with-github
## - login-with-gitlab
## - login-with-google
## - login-with-ldap
## - login-with-oidc
## - login-with-password
## - registration
## - secure-session-cookies
## - smtp
## - smtp-debug
## - telemetry
## - webhooks
## - prepl-server
##
## You can read more about all available flags and other
## environment variables for the backend here:
## https://help.penpot.app/technical-guide/configuration/#advanced-configuration
PENPOT_FLAGS="enable-registration enable-login-with-password disable-email-verification enable-smtp enable-prepl-server disable-telemetry"

# run penpot-update-flags.sh after changing
PENPOT_FRONTEND_FLAGS="enable-login-with-password enable-registration"

## Penpot SECRET KEY. It serves as a master key from which other keys for subsystems
## (eg http sessions, or invitations) are derived.
##
## If you leve it commented, all created sessions and invitations will
## become invalid on container restart.
##
## If you going to uncomment this, we recommend use here a trully randomly generated
## 512 bits base64 encoded string.  You can generate one with:
##
## python3 -c "import secrets; print(secrets.token_urlsafe(64))"
# PENPOT_SECRET_KEY=my-insecure-key

## The PREPL host. Mainly used for external programatic access to penpot backend
## (example: admin). By default it listen on `localhost` but if you are going to use
## the `admin`, you will need to uncomment this and set the host to `0.0.0.0`.

# PENPOT_PREPL_HOST=0.0.0.0

## Public URI. If you are going to expose this instance to the internet and use it
## under different domain than 'localhost', you will need to adjust it to the final
## domain.
##
## Consider using traefik and set the 'disable-secure-session-cookies' if you are
## not going to serve penpot under HTTPS.

PENPOT_PUBLIC_URI=http://localhost:9001

## Database connection parameters. Don't touch them unless you are using custom
## postgresql connection parameters.

PENPOT_DATABASE_URI=postgresql://localhost/penpot
PENPOT_DATABASE_USERNAME=penpot
PENPOT_DATABASE_PASSWORD=penpot

## Redis is used for the websockets notifications. Don't touch unless the redis
## container has different parameters or different name.

PENPOT_REDIS_URI=redis://localhost/0

## Default configuration for assets storage: using filesystem based with all files
## stored in a docker volume.

PENPOT_ASSETS_STORAGE_BACKEND=assets-fs
PENPOT_STORAGE_ASSETS_FS_DIRECTORY=/var/lib/penpot/

## Also can be configured to to use a S3 compatible storage
## service like MiniIO. Look below for minio service setup.

# AWS_ACCESS_KEY_ID=<KEY_ID>
# AWS_SECRET_ACCESS_KEY=<ACCESS_KEY>
# PENPOT_ASSETS_STORAGE_BACKEND=assets-s3
# PENPOT_STORAGE_ASSETS_S3_ENDPOINT=http://penpot-minio:9000
# PENPOT_STORAGE_ASSETS_S3_BUCKET=<BUKET_NAME>

## Telemetry. When enabled, a periodical process will send anonymous data about this
## instance. Telemetry data will enable us to learn on how the application is used,
## based on real scenarios. If you want to help us, please leave it enabled. You can
## audit what data we send with the code available on github

PENPOT_TELEMETRY_ENABLED=false

## Example SMTP/Email configuration. By default, emails are sent to the mailcatch
## service, but for production usage is recommended to setup a real SMTP
## provider. Emails are used to confirm user registrations & invitations. Look below
## how mailcatch service is configured.

PENPOT_SMTP_DEFAULT_FROM=no-reply@example.com
PENPOT_SMTP_DEFAULT_REPLY_TO=no-reply@example.com
PENPOT_SMTP_HOST=penpot-mailcatch
PENPOT_SMTP_PORT=1025
PENPOT_SMTP_USERNAME=
PENPOT_SMTP_PASSWORD=
PENPOT_SMTP_TLS=false
PENPOT_SMTP_SSL=false

