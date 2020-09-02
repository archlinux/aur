#include <cstring>
#include <fstream>

#include <png++/png.hpp>

void print_usage() {
	std::cerr << R"(Usage:
    pngunhide PNGFILE >FILE_OUT
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

	uint16_t tmp = 0;
	uint8_t tmp_size = 0;
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

				tmp_size -= 8;
			}
		}
	}

	return 0;
}

// vim: set ts=4 sw=4 :
