#include <cstring>
#include <fstream>
#include <iostream>
#include <png++/image.hpp>
#include <stdexcept>

#include <docopt/docopt.h>
#include <png++/png.hpp>
#include <png++/rgb_pixel.hpp>

#ifndef PROJECT_VERSION
#warning Using hardcoded version
#define PROJECT_VERSION "0.1.0"
#endif

auto get_version() {
	return "pnghide " PROJECT_VERSION;
}

auto get_usage() {
	return get_version() + std::string(R"(
Usage:
    pnghide hide [--input=FILE] [--output=FILE] <image>
    pnghide unhide [--output=FILE] [--limit=LIMIT] <image>

Options:
    -h, --help            print this message
    -v, --version         print version and exit
    -i, --input=FILE      set input file [default: /dev/stdin]
    -o, --output=FILE     set output file [default: /dev/stdout]
    -l, --limit=LIMIT     set limit reading bytes [default: -1]
)");
}
template <typename TPixel>
void proccess_hide(png::image<TPixel>& image,
				   std::istream& input,
				   std::ostream& output) {
	auto width = image.get_width();
	auto height = image.get_height();

	int row = 0;
	int cell = 0;

	uint16_t tmp = 0;
	uint8_t tmp_size = 0;

	size_t writed = 0;

	auto proccess_tmp = [&] {
		while (tmp_size >= 3) {
			char current_bits = (tmp >> (tmp_size - 3)) & 0b111;
			auto pixel = image.get_pixel(cell, row);

			pixel.red &= ~1;
			pixel.green &= ~1;
			pixel.blue &= ~1;

			pixel.red |= (current_bits >> 2) & 1;
			pixel.green |= (current_bits >> 1) & 1;
			pixel.blue |= (current_bits >> 0) & 1;

			tmp_size -= 3;

			image.set_pixel(cell, row, pixel);

			++cell;
			if (cell == width) {
				++row;
				cell = 0;
				if (row == height) {
					tmp_size = 0;
					throw std::runtime_error(
						"data size is bigger then image can store");
				}
			}
		}
	};

	try {
		while (std::cin.good()) {
			char buf;
			std::cin.read(&buf, 1);
			if (std::cin.gcount() == 0)
				break;
			++writed;
			tmp <<= 8;
			tmp |= buf;
			tmp_size += 8;
			proccess_tmp();
		}

		if (tmp_size != 0) {
			auto mod = tmp_size % 3;
			if (mod != 0) {
				tmp <<= 1;
				++tmp_size;
				if (mod == 2) {
					tmp <<= 1;
					++tmp_size;
				}
			}
			proccess_tmp();
		}
	} catch (const std::runtime_error& e) {
		std::cerr << "Error: size of input is very large\n";
	}

	try {
		for (;;) {
			tmp = 0;
			tmp_size = 8;
			proccess_tmp();
		}
	} catch (const std::runtime_error&) {
	}

	std::cerr << "Writed " << writed << " bytes\n";
}

template <typename TPixel>
void proccess_unhide(const png::image<TPixel>& image,
					 std::ostream& output,
					 long limit) {
	auto width = image.get_width();
	auto height = image.get_height();

	uint16_t tmp = 0;
	uint8_t tmp_size = 0;
	size_t readed = 0;
	for (size_t row = 0; row < height; ++row) {
		for (size_t cell = 0; cell < width; ++cell) {
			tmp <<= 3;
			tmp_size += 3;
			auto pixel = image.get_pixel(cell, row);
			tmp |= (pixel.red & 1) << 2;
			tmp |= (pixel.green & 1) << 1;
			tmp |= (pixel.blue & 1) << 0;

			if (tmp_size > 8) {
				char out_char = (tmp >> (tmp_size - 8)) & 0xff;
				std::cout.write(&out_char, 1);
				if (limit != -1) {
					++readed;
					if (readed >= limit)
						return;
				}

				tmp_size -= 8;
			}
		}
	}
}

int main(int argc, const char** argv) {
	auto args = docopt::docopt(get_usage(), {argv + 1, argv + argc}, true,
							   get_version());

	auto hide = args.at("hide").asBool();
	auto unhide = args.at("unhide").asBool();
	auto image_file = args.at("<image>").asString();
	auto input = args.at("--input").asString();
	auto output = args.at("--output").asString();
	auto limit = args.at("--limit").asLong();

	std::ifstream fin;
	std::ofstream fout;

	png::image<png::rgb_pixel> image(image_file);

	if (output != "/dev/stdout") {
		fout.open(output);
		std::cout.rdbuf(fout.rdbuf());
	}

	if (hide) {
		if (input != "/dev/stdin") {
			fin.open(input);
			std::cin.rdbuf(fin.rdbuf());
		}
		proccess_hide(image, std::cin, std::cout);
		image.write_stream(std::cout);
	} else if (unhide) {
		proccess_unhide(image, std::cout, limit);
	}

	return 0;
}

// vim: set ts=4 sw=4 :
