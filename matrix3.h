/*
Danger from the Deep - Open source submarine simulation
Copyright (C) 2003-2006  Thorsten Jordan, Luis Barrancos and others.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

//
//  A 3x3 matrix (C)+(W) 2001 Thorsten Jordan
//

#ifndef MATRIX3_H
#define MATRIX3_H

#include "matrix.h"
#include <cstring>

/// a 3x3 matrix, reimplemented for 3x3 case for speed issues
template<class D>
class matrix3t
{
	D values[3*3];

	matrix3t(int /*dummy*/) {} // internal use

 public:
	/// empty matrix
	matrix3t() {
		memset(values, 0, sizeof(D)*3*3);
	}

	/// create full matrix
	matrix3t(const D& e0, const D& e1, const D& e2, const D& e3,
		const D& e4, const D& e5, const D& e6, const D& e7,
		const D& e8) {
		values[0] = e0;
		values[1] = e1;
		values[2] = e2;
		values[3] = e3;
		values[4] = e4;
		values[5] = e5;
		values[6] = e6;
		values[7] = e7;
		values[8] = e8;
	}

	/// return pointer to array of elements
	const D* elemarray() const {
		return &values[0];
	}

	D* elemarray() {
		return &values[0];
	}

	/// construct 3x3 matrix from one with different template type but same dimension
	template<class E> matrix3t(const matrix3t<E>& other) {
		const E* ea = other.elemarray();
		for (unsigned i = 0; i < 3*3; ++i)
			values[i] = D(ea[i]);
	}

	/// construct from stream
        matrix3t(std::istream& is) {
		for (unsigned i = 0; i < 3*3; ++i)
			is >> values[i];
	}

	/// print to stream
	void to_stream(std::ostream& os) const {
		os << values[0];
		for (unsigned i = 1; i < 3 * 3; ++i)
			os << " " << values[i];
	}

	/// multiply by scalar
	matrix3t<D> operator* (const D& s) const {
		matrix3t<D> r(int(0));
		for (unsigned i = 0; i < 3*3; ++i) r.values[i] = values[i] * s;
		return r;
	}

	/// add matrices
	matrix3t<D> operator+ (const matrix3t<D>& other) const {
		matrix3t<D> r(int(0));
		for (unsigned i = 0; i < 3*3; ++i) r.values[i] = values[i] + other.values[i];
		return r;
	}

	/// subtract matrices
	matrix3t<D> operator- (const matrix3t<D>& other) const {
		matrix3t<D> r(int(0));
		for (unsigned i = 0; i < 3*3; ++i) r.values[i] = values[i] - other.values[i];
		return r;
	}

	/// multiply matrices
	matrix3t<D> operator* (const matrix3t<D>& other) const {
		matrix3t<D> r(int(0));
		r.values[0] = values[0] * other.values[0] + values[1] * other.values[3] + values[2] * other.values[6];
		r.values[1] = values[0] * other.values[1] + values[1] * other.values[4] + values[2] * other.values[7];
		r.values[2] = values[0] * other.values[2] + values[1] * other.values[5] + values[2] * other.values[8];
		r.values[3] = values[3] * other.values[0] + values[4] * other.values[3] + values[6] * other.values[6];
		r.values[4] = values[3] * other.values[1] + values[4] * other.values[4] + values[6] * other.values[7];
		r.values[5] = values[3] * other.values[2] + values[4] * other.values[5] + values[6] * other.values[8];
		r.values[6] = values[6] * other.values[0] + values[7] * other.values[3] + values[8] * other.values[6];
		r.values[7] = values[6] * other.values[1] + values[7] * other.values[4] + values[8] * other.values[7];
		r.values[8] = values[6] * other.values[2] + values[7] * other.values[5] + values[8] * other.values[8];
		return r;
	}

	/// negate matrix
	matrix3t<D> operator- () const {
		matrix3t<D> r(int(0));
		for (unsigned i = 0; i < 3*3; ++i) r.values[i] = -values[i];
		return r;
	}


	/// create identitiy matrix
	static matrix3t<D> one() { matrix3t<D> r; r.values[0] = r.values[4] = r.values[8] = D(1.0); return r; }

	/// get transposed matrix
	matrix3t<D> transpose() const {
		matrix3t<D> r(int(0));
		r.values[0] = values[0];
		r.values[1] = values[3];
		r.values[2] = values[6];
		r.values[3] = values[1];
		r.values[4] = values[4];
		r.values[5] = values[7];
		r.values[6] = values[2];
		r.values[7] = values[5];
		r.values[8] = values[8];
		return r;
	}

	/// get inverse of matrix
	matrix3t<D> inverse() const {
		matrix3t<D> r(*this);
		matrix_invert<D, 3U>(r.elemarray());
		return r;
	}

	/// multiply matrix with vector
	vector3t<D> operator* (const vector3t<D>& v) const {
		return vector3t<D>(values[0]*v.x + values[1]*v.y + values[2]*v.z,
				   values[3]*v.x + values[4]*v.y + values[5]*v.z,
				   values[6]*v.x + values[7]*v.y + values[8]*v.z);
	}

	/// create matrix from square of vector
	static matrix3t<D> vec_sqr(const vector3t<D>& v) {
		return matrix3t<D>(v.x*v.x, v.x*v.y, v.x*v.z,
				   v.y*v.x, v.y*v.y, v.y*v.z,
				   v.z*v.x, v.z*v.y, v.z*v.z);
	}

	/// determinate
	D determinant() const {
		return    values[0]*values[4]*values[8]
			+ values[1]*values[5]*values[6]
			+ values[2]*values[3]*values[7]
			- values[0]*values[5]*values[7]
			- values[1]*values[3]*values[8]
			- values[2]*values[4]*values[6];
	}

	D& elem(unsigned col, unsigned row) { return values[col + row * 3]; }
	const D& elem(unsigned col, unsigned row) const { return values[col + row * 3]; }
};

typedef matrix3t<double> matrix3;
typedef matrix3t<float> matrix3f;

#endif
