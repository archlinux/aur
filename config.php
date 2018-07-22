<?php
#
# Overrides the default parameters in config.inc.php
#
# You should set the correct LDAP configuration,
# select the desired password policy (0 is off),
# choose which ways the users should be allowed
# to reset the password. Also change the keyphrase
# from 'secret' to a long random string.
#

# display the top menu
$show_menu = false;

# LDAP config
$ldap_url = "ldap://localhost";
$ldap_starttls = false;
$ldap_binddn = "uid=someone,ou=something,dc=example,dc=com";
$ldap_bindpw = "secret pw";
$ldap_base = "dc=example,dc=com";
$ldap_login_attribute = "uid";
$ldap_fullname_attribute = "displayName";
$ldap_filter = "(&(objectClass=inetOrgPerson)($ldap_login_attribute={login}))";

# Local password policy
# This is applied before directory password policy
# Minimal length
$pwd_min_length = 8;
# Maximal length
$pwd_max_length = 0;
# Minimal lower characters
$pwd_min_lower = 0;
# Minimal upper characters
$pwd_min_upper = 0;
# Minimal digit characters
$pwd_min_digit = 2;
# Minimal special characters
$pwd_min_special = 1;
# Definition of special characters
$pwd_special_chars = "^a-zA-Z0-9";
# Forbidden characters
#$pwd_forbidden_chars = "@%";
# Don't reuse the same password as currently
$pwd_no_reuse = true;
# Check that password is different than login
$pwd_diff_login = true;
# Complexity: number of different class of character required
$pwd_complexity = 3;
# use pwnedpasswords api v2 to securely check if the password has been on a leak
$use_pwnedpasswords = true;
# Show policy constraints message:
# always
# never
# onerror
$pwd_show_policy = "onerror";
# Position of password policy constraints message:
# above - the form
# below - the form
$pwd_show_policy_pos = "above";

## Questions
$use_questions = false;

## Token
$use_tokens = false;
$keyphrase = "secret";

## SMS
$use_sms = false;

?>
