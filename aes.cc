#include <docopt/docopt.h>
#include <docopt/docopt_value.h>
#include <fcntl.h>
#include <gcrypt.h>
#include <termios.h>
#include <unistd.h>
#include <cstring>
#include <iostream>
#include <memory>
#include <stdexcept>

#ifndef PROJECT_VERSION
#warning Use hardcoded version
#define PROJECT_VERSION "0.1.0"
#endif

auto get_version() {
	/* TODO */
	return "aes v" PROJECT_VERSION;
}

auto get_usage() {
	/* TODO */
	return get_version() + std::string(R"(

Usage:
	aes [options]

Options:
    -d, --decrypt                  decrypt data
    -p, --password=PASSWORD        use password [default: prompt]
    -k, --key=KEY                  use key instead password [default: ]
    -l, --last=LAST                size of last block [default: 0]
    -b, --bits=BITS                use aes with specified bits [default: 256]
)");
}

gcry_error_t proccess_encrypt(gcry_cipher_hd_t hd,
							  const char* block_in,
							  char* block_out) {
	return gcry_cipher_encrypt(hd, block_out, 16, block_in, 16);
}

gcry_error_t proccess_decrypt(gcry_cipher_hd_t hd,
							  const char* block_in,
							  char* block_out) {
	return gcry_cipher_decrypt(hd, block_out, 16, block_in, 16);
}

void try_gcry(gcry_error_t err) {
	auto code = gcry_err_code(err);

	if (code != 0) {
		throw std::runtime_error((const char*)gcry_err_source(err));
	}
}

int main(int argc, const char** argv) {
	auto args = docopt::docopt(get_usage(), {argv + 1, argv + argc}, true,
							   get_version());

	auto decrypt = args.at("--decrypt").asBool();
	auto password = args.at("--password").asString();
	auto key = args.at("--key").asString();
	auto bits = args.at("--bits").asLong();
	auto last = args.at("--last").asLong();
	try {
		if (password != "prompt" && key != "") {
			throw std::invalid_argument(
				"using --password and --key at some time is imposible.");
		}

		if (last > 15 || last < 0) {
			throw std::invalid_argument("--last should be between 0 and 15.");
		}

		if (bits != 256 && bits != 128) {
			throw std::invalid_argument("--bits should be 128 or 256.");
		}

		if (key.size() != 0 && key.size() != (bits >> 1)) {
			throw std::invalid_argument("--key size should be equal BITS/2");
		}

		if (decrypt == false && last != 0) {
			std::cerr << "Note: using --last possible only with --decrypt\n";
		}
	} catch (const std::invalid_argument& e) {
		std::cerr << e.what() << '\n';
		return 1;
	}

	size_t key_size = bits >> 2;
	std::unique_ptr<char[]> key_arr(new char[key_size]);

	if (key == "") {
		if (password == "prompt") {
			password = getpass("Enter password:");
		}
		gcry_md_hd_t md_handle;
		try_gcry(gcry_md_open(&md_handle, GCRY_MD_SHA512, 0));

		gcry_md_write(md_handle, password.data(), password.size());

		std::memcpy(key_arr.get(), gcry_md_read(md_handle, GCRY_MD_SHA512),
					key_size);

		gcry_md_close(md_handle);
	} else {
		for (size_t i = 0; i < key_size; ++i) {
			char buf[3]{0, 0, 0};

			buf[0] = key[(i << 1) + 0];
			buf[1] = key[(i << 1) + 1];
			buf[2] = 0;

			key_arr[i] = std::strtol(buf, nullptr, 16);
		}
	}

	int algo = GCRY_CIPHER_AES256;
	if (bits == 128) {
		algo = GCRY_CIPHER_AES128;
	}

	gcry_cipher_hd_t hd;
	try_gcry(gcry_cipher_open(&hd, algo, GCRY_CIPHER_MODE_XTS, 0));
	try_gcry(gcry_cipher_setkey(hd, key_arr.get(), key_size));

	auto proccess = decrypt ? proccess_decrypt : proccess_encrypt;

	while (std::cin.good()) {
		char block_in[16];
		char block_out[16];

		std::cin.read(block_in, 16);
		size_t readed = std::cin.gcount();

		if (readed == 0)
			break;

		if (readed != 16) {
			std::cerr << "last block size: " << readed << '\n';
			std::memset(block_in + readed, 0, 16 - readed);
		}

		try_gcry(proccess(hd, block_in, block_out));

		if (std::cin.peek() == EOF) {
			if (last != 0) {
				std::cout.write(block_out, last);
				break;
			}
		}

		std::cout.write(block_out, 16);
	}

	gcry_cipher_close(hd);

	return 0;
}
