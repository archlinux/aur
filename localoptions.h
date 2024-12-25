/*
 * Arch Linux configuration for DropBear
 *
 * The majority of these options are disabled or enabled as a result of
 * running ssh-audit:
 *
 * https://github.com/arthepsy/ssh-audit
 */

/* Disable CBC mode for ciphers */
#define DROPBEAR_ENABLE_CBC_MODE 0

/* Disable X11 forwarding on the server */
#define DROPBEAR_X11FWD 0

/* Disable reverse DNS lookups */
#define DO_HOST_LOOKUP 0

/* Enable twofish128 and twofish256 */
#define DROPBEAR_TWOFISH128 1
#define DROPBEAR_TWOFISH256 1

/* Disable SHA-96 */
#define DROPBEAR_SHA1_HMAC 0
#define DROPBEAR_SHA1_96_HMAC 0

/* Disable DSS */
#define DROPBEAR_DSS 0

/* Disable ECDH */
#define DROPBEAR_ECDH 0

/* Keep ECDSA, for practical purposes */
#define DROPBEAR_ECDSA 1

/* SFTP server path */
#define SFTPSERVER_PATH "/usr/lib/ssh/sftp-server"

/* Spend a small amount of bytes for an increase in performance */
#define DROPBEAR_SMALL_CODE 0

/* Default path */
#define DEFAULT_PATH "/usr/bin"

/* Enable GCM mode, ref. FS#70781 */
#define DROPBEAR_ENABLE_GCM_MODE 1
