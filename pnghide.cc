#include <cstring>
#include <fstream>

#include <png++/png.hpp>
#include <png++/rgb_pixel.hpp>
#include <stdexcept>

void print_usage() {
	std::cerr << R"(Usage:
    pnghide PNGFILE <FILE_IN >PNGFILE_OUT
)";
}

int main(int argc, const char** argv) {
	if (argc != 2 || (std::strcmp(argv[1], "--help") == 0)) {
		print_usage();
		return 1;
	}

	png::image<png::rgb_pixel> image(argv[1]);

	auto width = image.get_width();
	auto height = image.get_height();

	int row = 0;
	int cell = 0;

	uint16_t tmp = 0;
	uint8_t tmp_size = 0;

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
					throw std::runtime_error(
						"data size is bigger then image can store");
				}
			}
		}
	};

	while (std::cin.good()) {
		char buf;
		std::cin.read(&buf, 1);
		if (std::cin.gcount() == 0)
			break;
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

	try {
		for (;;) {
			tmp = 0;
			tmp_size = 8;
			proccess_tmp();
		}
	} catch (const std::runtime_error&) {
	}

	image.write_stream(std::cout);

	return 0;
}

// vim: set ts=4 sw=4 :
