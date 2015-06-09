#include <stdio.h>
#include <string.h>
#include <math.h>
#include <assert.h>

#include <openssl/evp.h>
#include <openssl/bn.h>
#include <openssl/ec.h>
#include <openssl/obj_mac.h>

#if !defined(_WIN32)
#include <unistd.h>
#else
#include "winglue.h"
#endif

const char *vg_b58_alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

void vg_b58_encode_check(void *buf, size_t len, char *result)
{
	unsigned char hash1[32];
	unsigned char hash2[32];

	int d, p;

	BN_CTX *bnctx;
	BIGNUM *bn, *bndiv, *bntmp;
	BIGNUM bna, bnb, bnbase, bnrem;
	unsigned char *binres;
	int brlen, zpfx;

	bnctx = BN_CTX_new();
	BN_init(&bna);
	BN_init(&bnb);
	BN_init(&bnbase);
	BN_init(&bnrem);
	BN_set_word(&bnbase, 58);

	bn = &bna;
	bndiv = &bnb;

	brlen = (2 * len) + 4;
	binres = (unsigned char*) malloc(brlen);
	memcpy(binres, buf, len);

	SHA256(binres, len, hash1);
	SHA256(hash1, sizeof(hash1), hash2);
	memcpy(&binres[len], hash2, 4);

	BN_bin2bn(binres, len + 4, bn);

	for (zpfx = 0; zpfx < (len + 4) && binres[zpfx] == 0; zpfx++);

	p = brlen;
	while (!BN_is_zero(bn)) {
		BN_div(bndiv, &bnrem, bn, &bnbase, bnctx);
		bntmp = bn;
		bn = bndiv;
		bndiv = bntmp;
		d = BN_get_word(&bnrem);
		binres[--p] = vg_b58_alphabet[d];
	}

	while (zpfx--) {
		binres[--p] = vg_b58_alphabet[0];
	}

	memcpy(result, &binres[p], brlen - p);
	result[brlen - p] = '\0';

	free(binres);
	BN_clear_free(&bna);
	BN_clear_free(&bnb);
	BN_clear_free(&bnbase);
	BN_clear_free(&bnrem);
	BN_CTX_free(bnctx);
}

void vg_encode_privkey(const EC_KEY *pkey, int addrtype, char *result)
{
        unsigned char eckey_buf[128];
        const BIGNUM *bn;
        int nbytes;

        bn = EC_KEY_get0_private_key(pkey);

        eckey_buf[0] = addrtype;
        nbytes = BN_num_bytes(bn);
        assert(nbytes <= 32);
        if (nbytes < 32)
                memset(eckey_buf + 1, 0, 32 - nbytes);
        BN_bn2bin(bn, &eckey_buf[33 - nbytes]);

        vg_b58_encode_check(eckey_buf, 33, result);
}

void vg_encode_address(const EC_POINT *ppoint, const EC_GROUP *pgroup, int addrtype, char *result)
{
        unsigned char eckey_buf[128], *pend;
        unsigned char binres[21] = {0,};
        unsigned char hash1[32];

        pend = eckey_buf;

        EC_POINT_point2oct(pgroup,
                           ppoint,
                           POINT_CONVERSION_UNCOMPRESSED,
                           eckey_buf,
                           sizeof(eckey_buf),
                           NULL);
        pend = eckey_buf + 0x41;
        binres[0] = addrtype;
        SHA256(eckey_buf, pend - eckey_buf, hash1);
        RIPEMD160(hash1, sizeof(hash1), &binres[1]);

        vg_b58_encode_check(binres, sizeof(binres), result);
}

int main(int argc, char **argv)
{
	char ecprot[128];
	char pbuf[1024];
	EC_KEY *pkey;
	unsigned char *pend = (unsigned char *) pbuf;

	int count = argc > 1 ? atoi(argv[1]) : 1;

	OpenSSL_add_all_algorithms();

	while(count-- > 0) {
		pkey = EC_KEY_new_by_curve_name(NID_secp256k1);
		EC_KEY_generate_key(pkey);
		i2o_ECPublicKey(pkey, &pend);
		vg_encode_address(EC_KEY_get0_public_key(pkey), EC_KEY_get0_group(pkey), 0, ecprot);
		printf("Address: %s\n", ecprot);
		vg_encode_privkey(pkey, 128, ecprot);
		printf("Privkey: %s\n\n", ecprot);
	}
}


