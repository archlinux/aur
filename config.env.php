<?php

# MANDATORY SETTINGS

# The URI of the LDAP server.
putenv("LDAP_URI='ldap://ldap.example.com");
# The base DN for your organisation.
putenv("LDAP_BASE_DN='dc=example,dc=com");
# The DN for the user with permission to modify all records under LDAP_BASE_DN.
putenv("LDAP_ADMIN_BIND_DN='cn=admin,dc=example,dc=com");
# The password for LDAP_ADMIN_BIND_DN.
putenv("LDAP_ADMIN_BIND_PWD='XXXXXX");
# The name of the group used to define accounts that can use this tool to manage LDAP accounts.
putenv("LDAP_ADMINS_GROUP='admins");

# OPTIONAL SETTINGS - ORGANIZATION

# The hostname that this interface will be served from.
putenv("SERVER_HOSTNAME='ldapusername.org");
# The path to the user manager on the webserver. Useful if running this behind a reverse proxy. No trailing slash needed if subdirectory.
putenv("SERVER_PATH='/");
# Your organisation's name.
putenv("ORGANISATION_NAME='LDAP");
# Change this to replace the title in the menu,
putenv("SITE_NAME='My Company Account Management");

# OPTIONAL SETTINGS - BASIC LDAP

# The name of the OU used to store user accounts (without the base DN appended).
putenv("LDAP_USER_OU='people");
# The name of the OU used to store groups (without the base DN appended).
putenv("LDAP_GROUP_OU='groups");
#  If TRUE then a TLS connection is required for this interface to work. If set to FALSE then the interface will work without STARTTLS, but a warning will be displayed on the page.
putenv("LDAP_REQUIRE_STARTTLS=TRUE");
# If TRUE then problems with the certificate presented by the LDAP server will be ignored (for example FQDN mismatches). Use this if your LDAP server is using a self-signed certificate and you don't have a CA certificate for it or you're connecting to a pool of different servers via round-robin DNS.
putenv("LDAP_IGNORE_CERT_ERRORS=FALSE");
#If you need to use a specific CA certificate for TLS connections to the LDAP server (when LDAP_REQUIRE_STARTTLS is set) then assign the contents of the CA certificate to this variable. e.g. -e LDAP_TLS_CACERT="$(</path/to/ca.crt)" (ensure you're using quotes or you'll get an "invalid reference format: repository name must be lowercase" error.
#putenv("LDAP_TLS_CACERT=");

# OPTIONAL SETTINGS - ADVANCED LDAP
# These settings should only be changed if you're trying to make the user manager work with an LDAP directory that's already populated and the defaults don't work.

# The account attribute used as the account identifier. See Account names for more information.
#putenv("LDAP_ACCOUNT_ATTRIBUTE='uid");
# The attribute used when adding a user's account to a group. When the groupOfMembers objectClass is detected FORCE_RFC2307BIS is TRUE it defaults to uniqueMember, otherwise it'll default to memberUID. Explicitly setting this variable will override any default.
#putenv("LDAP_GROUP_MEMBERSHIP_ATTRIBUTE='memberUID");
# A comma-separated list of additional objectClasses to use when creating an account. See Extra objectClasses and attributes for more information.
#putenv("LDAP_ACCOUNT_ADDITIONAL_OBJECTCLASSES='");
# A comma-separated list of extra attributes to display when creating an account. See Extra objectClasses and attributes for more information.
#putenv("LDAP_ACCOUNT_ADDITIONAL_ATTRIBUTES='");
# If TRUE then the entry for a member of a group will be just the username, otherwise it's the member's full DN. When the groupOfMembers objectClass is detected or FORCE_RFC2307BIS is TRUE it defaults to FALSE, otherwise it'll default to TRUE. Explicitly setting this variable will override the default.
#putenv("LDAP_GROUP_MEMBERSHIP_USES_UID=TRUE");
# Set to TRUE if the auto-detection is failing to spot that the RFC2307BIS schema is available. When FALSE the user manager will use auto-detection. See Using the RFC2307BIS schema for more information.
#putenv("FORCE_RFC2307BIS=FALSE");

# OPTIONAL SETTINGS - USERS

# The group that new accounts are automatically added to when created. NOTE: If this group doesn't exist then a group is created with the same name as the username and the user is added to that group.
#putenv("DEFAULT_USER_GROUP='everybody");
# The shell that will be launched when the user logs into a server.
#putenv("DEFAULT_USER_SHELL='/bin/bash");
# If set then the email address field will be automatically populated in the form of username@email_domain.
#putenv("EMAIL_DOMAIN='");
# If set to TRUE (the default) this will check system login and group names against USERNAME_REGEX to ensure they're safe to use on servers. See Account names for more information.
#putenv("ENFORCE_SAFE_SYSTEM_NAMES=TRUE");
# The template used to dynamically generate the usernames stored in the uid attribute. See Username format.
#putenv("USERNAME_FORMAT='");
# The regular expression used to ensure account names and group names are safe to use on servers. See Username format.
#putenv("USERNAME_REGEX='^[a-z][a-zA-Z0-9._-]{3,32}$");
# Select which hashing method which will be used to store passwords in LDAP. Options are (in order of precedence) SHA512CRYPT, SHA256CRYPT, MD5CRYPT, SSHA, SHA, SMD5, MD5, CRYPT & CLEAR. If your chosen method isn't available on your system then the strongest available method will be automatically selected - SSHA is the strongest method guaranteed to be available. Cleartext passwords should NEVER be used in any situation outside of a test.
#putenv("PASSWORD_HASH='");
# Set this to TRUE to prevent a password being rejected for being too weak. The password strength indicators will still gauge the strength of the password. Don't enable this in a production environment.
#putenv("ACCEPT_WEAK_PASSWORDS=FALSE");

# OPTIONAL SETTINGS - EMAIL
#To send emails you'll need to use an existing SMTP server. Email sending will be disabled if SMTP_HOSTNAME isn't set.

# The hostname of an SMTP server - used to send emails when creating new accounts.
#putenv("SMTP_HOSTNAME=");
# The SMTP port on the SMTP server.
#putenv("SMTP_HOST_PORT=25");
# The username to use when the SMTP server requires authentication.
#putenv("SMTP_USERNAME=");
# The password to use when the SMTP server requires authentication.
#putenv("SMTP_PASSWORD=XXXXXX");
# Set to TRUE if the SMTP server requires TLS to be enabled. Overrides SMTP_USE_TLS.
#putenv("SMTP_USE_TLS=FALSE");
# Set to TRUE if the SMTP server requires SSL to be enabled. This will be unset if SMTP_USE_TLS is TRUE.
#putenv("SMTP_USE_SSL=FALSE");
# The FROM email address used when sending out emails. The default domain is taken from EMAIL_DOMAIN under User account settings.
#putenv("EMAIL_FROM_ADDRESS=admin@EMAIL_DOMAIN");
# The FROM name used when sending out emails. The default name is taken from SITE_NAME under Organisation settings.
#putenv("EMAIL_FROM_NAME=SITE_NAME");
# The mail subject for new account emails.
#putenv("MAIL_SUBJECT=Your ORGANISATION_NAME account has been created");
# Change the email contents for emails sent to users when you create an account or reset a password. See Sending emails for full details.
#putenv("NEW_ACCOUNT_EMAIL_SUBJECT=");
#putenv("NEW_ACCOUNT_EMAIL_BODY=");
#putenv("RESET_PASSWORD_EMAIL_SUBJECT=");
#putenv("RESET_PASSWORD_EMAIL_BODY=");

# OPTIONAL SETTINGS - ACCOUNT REQUESTS

# Set to TRUE in order to enable a form that people can fill in to request an account. This will send an email to ACCOUNT_REQUESTS_EMAIL with their details and a link to the account creation page where the details will be filled in automatically. You'll need to set up email sending (see Email sending, above) for this to work. If this is enabled but email sending isn't then requests will be disabled and an error message sent to the logs.
putenv("ACCOUNT_REQUESTS_ENABLED=FALSE");
# This is the email address that any requests for a new account are sent to.
#putenv("ACCOUNT_REQUESTS_EMAIL=EMAIL_FROM_ADDRESS");


# OPTIONAL SETTINGS - SECURITY

# If you set this to TRUE then the server will run in HTTP mode, without any encryption. This is insecure and should only be used for testing. See HTTPS certificates
putenv("NO_HTTPS=FALSE");
# How long before an idle session will be timed out.
putenv("SESSION_TIMEOUT=600");
# Set to TRUE to increase the logging level for LDAP requests. This will output passwords to the error log - don't enable this in a production environment. This is for information on problems updating LDAP records and such. To debug problems connecting to the LDAP server in the first place use LDAP_VERBOSE_CONNECTION_LOGS.
putenv("LDAP_DEBUG=FALSE");
# Set to TRUE to enable detailed LDAP connection logs (PHP's LDAP_OPT_DEBUG_LEVEL 7). This will flood the logs with detailled LDAP connection information so disable this for production environments.
putenv("LDAP_VERBOSE_CONNECTION_LOGS=FALSE");
# Set to TRUE to increase the logging level for sessions and user authorisation. This will output cookie passkeys to the error log - don't enable this in a production environment.
putenv("SESSION_DEBUG=FALSE");
# Set to between 1-4 to get SMTP logging information (0 disables SMTP debugging logs though it will still display errors). See https://github.com/PHPMailer/PHPMailer/wiki/SMTP-Debugging for details of the levels.
putenv("SMTP_LOG_LEVEL=0");

?>
