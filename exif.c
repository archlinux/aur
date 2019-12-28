// This module is a replacement for pyexiv2 in the mirage image viewer.
//
// pyexiv2 is a Python 2 binding to the exiv2, a popular library for reading
// EXIF, IPTC and XMP metadata from image files. mirage 1.0_pre1 and later uses
// it to get some basic metadata like image orientation, camera model and some
// other tags related to picture-taking. This library is not required, but is
// nice to have. The problem is that pyexiv2 depends on an outdated version of
// exiv2, so it can't be compiled with the latest one (0.27.2). I had the
// following choices:
//
// 1. Use libgexiv2, it provides Python bindings through PyGObject. The problem
//    is that PyGObject uses GTK3 and mirage is written with GTK2 (PyGTK), this
//    would require porting the entire application to GTK3 and this is not a
//    very straigh-forward solution.
// 2. Use py3exiv2 which supports only Python 3. But PyGTK does not support
//    Python 3. So again, I'd need to port mirage to GTK3 and this has the
//    exact same problems that solution #1 has.
// 3. Use GObject 2 which works on Python 2. However, libgexiv2 doesn't provide
//    bindings for GObject 2.
// 4. Patch pyexiv2 so that it can be compiled with modern exiv2. This is a
//    very hard task for me since I don't have much experience with C/C++,
//    Boost.Python and Python internals. And nobody needs this binding nowadays
//    anyway.
// 5. Create a replacement bindings for exiv2 just for this application. I
//    tried to do this, but quickly abandoned this idea because C++ is just too
//    hard for me.
//
// Then I examined the source code of mirage and noticed that it only uses EXIF
// metadata and ignores IPTC and XMP. I quickly found a popular C library for
// parsing EXIF called libexif. "Why not use a Python library?" you might ask.
// Well, for two reasons:
//
// a) I was packaging mirage for latest version of mirage (1.0_pre2) for AUR
//    (Arch User Repository) and decided to use a well-known library which can
//    be found in official Arch Linux repositories and is used by other popular
//    applications. libexif is a perfect candidate because it is in the 'extra'
//    repo and is used by GIMP, PCManFM, Thunar, Ristretto and (indirectly)
//    Mono.
// b) libexif is written in C and I wrote C for Arduino in the past, plus I
//    have a lot of experience with Rust. It ain't much, but I wanted to learn
//    something new.
//
// So, I decided to write a Python extension in C that is a binding to libexif
// that allows you only to read metadata of an image file (because that's the
// only feature mirage needs).

// Useful Links:
// https://libexif.github.io/api/index.html
// https://github.com/libexif/libexif
// https://docs.python.org/2/extending/extending.html
// https://docs.python.org/2/c-api/concrete.html
// https://pythonextensionpatterns.readthedocs.io/en/latest/refcount.html
// https://www.exif.org/Exif2-2.PDF

#include <Python.h>
#include <libexif/exif-data.h>

// Converts a numeric value stored in an EXIF entry to a Python object. Returns
// NULL If a non-numeric format is provided.
PyObject* mirage_exif_number_to_py(const unsigned char* ptr, ExifFormat format, ExifByteOrder bo) {
  PyObject* py_num = NULL;
  switch (format) {
    // Size of all EXIF integers is <= 32 bits, so they can be safely stored in
    // PyInt. All numeric types are signed by default and 'S' in type names
    // means 'signed'.
    // 8-bit
    case EXIF_FORMAT_BYTE:
    case EXIF_FORMAT_SBYTE:
      py_num = PyInt_FromLong(*ptr);
      break;
    // 16-bit
    case EXIF_FORMAT_SHORT:
      py_num = PyInt_FromLong(exif_get_short(ptr, bo));
      break;
    case EXIF_FORMAT_SSHORT:
      py_num = PyInt_FromLong(exif_get_sshort(ptr, bo));
      break;
    // 32-bit
    case EXIF_FORMAT_LONG:
      py_num = PyInt_FromLong(exif_get_long(ptr, bo));
      break;
    case EXIF_FORMAT_SLONG:
      py_num = PyInt_FromLong(exif_get_slong(ptr, bo));
      break;
    // rational numbers consist of two LONGs, they are represented as a PyTuple
    // with two PyInts
    // TODO: can code duplication be reduced here?
    case EXIF_FORMAT_RATIONAL: {
      ExifRational r = exif_get_rational(ptr, bo);
      PyObject* n = PyInt_FromLong(r.numerator);
      PyObject* d = PyInt_FromLong(r.denominator);
      py_num = PyTuple_Pack(2, n, d);
      Py_DECREF(n);
      Py_DECREF(d);
    } break;
    case EXIF_FORMAT_SRATIONAL: {
      ExifSRational r = exif_get_srational(ptr, bo);
      PyObject* n = PyInt_FromLong(r.numerator);
      PyObject* d = PyInt_FromLong(r.denominator);
      py_num = PyTuple_Pack(2, n, d);
      Py_DECREF(n);
      Py_DECREF(d);
    } break;
  }
  return py_num;
}

// Converts contents of an EXIF entry to a Python object.
PyObject* mirage_exif_entry_to_py(ExifEntry* e, ExifByteOrder byte_order) {
  PyObject* py_value = NULL;
  switch (e->format) {
    case EXIF_FORMAT_BYTE:
    case EXIF_FORMAT_SBYTE:
    case EXIF_FORMAT_SHORT:
    case EXIF_FORMAT_SSHORT:
    case EXIF_FORMAT_LONG:
    case EXIF_FORMAT_SLONG:
    case EXIF_FORMAT_RATIONAL:
    case EXIF_FORMAT_SRATIONAL:
      // numeric values are stored in a PyList even if e->components == 1 to
      // reduce code complexity
      py_value = PyList_New(e->components);
      unsigned char format_size = exif_format_get_size(e->format);
      for (Py_ssize_t i = 0; i < e->components; i++) {
        const unsigned char* ptr = e->data + i*format_size;
        PyObject* py_num = mirage_exif_number_to_py(ptr, e->format, byte_order);
        // Note that PyList_SetItem does not increase refcount of added item
        // (py_num in this case), documentation says that it "steals" a
        // reference to it, so refcount shouldn't be decremented here.
        PyList_SetItem(py_value, i, py_num);
      }
      break;

    case EXIF_FORMAT_ASCII:
      // ASCII entries contain a null-terminated string of bytes with 7-bit
      // ASCII codes. 1 is subtracted here to chop off the last null ('\0')
      // byte.
      py_value = PyString_FromStringAndSize(e->data, e->size ? e->size - 1 : 0);
      break;

    default:
      // Content of an entry with an unknown format (including
      // EXIF_FORMAT_UNDEFINED) is simply converted to a PyByteArray.
      py_value = PyByteArray_FromStringAndSize(e->data, e->size);
  }
  return py_value;
}

// Converts all entries inside an IFD (image file directory) to a PyDict with
// EXIF tag names as keys and entry values (see mirage_exif_entry_to_py) as
// values.
PyObject* mirage_exif_ifd_entries_to_py(ExifContent* c, ExifIfd ifd, ExifByteOrder byte_order) {
  PyObject* py_entries = PyDict_New();

  for (Py_ssize_t i = 0; i < c->count; i++) {
    ExifEntry* entry = c->entries[i];
    if (!entry) continue;

    const char* tag_name = exif_tag_get_name_in_ifd(entry->tag, ifd);
    PyObject* py_entry_value = mirage_exif_entry_to_py(entry, byte_order);
    PyDict_SetItemString(py_entries, tag_name, py_entry_value);
    Py_DECREF(py_entry_value);
  }

  return py_entries;
}

// Reads EXIF metadata from a file and returns a PyDict with IFD names ('EXIF',
// '0', '1', 'GPS' etc, see EXIF specification) as keys and PyDicts of IFD
// entries (see mirage_exif_ifd_entries_to_py) as values.
PyObject* mirage_exif_read_metadata(PyObject* self, PyObject* args) {
  const char* filename;
  int filename_len;
  if (!PyArg_ParseTuple(args, "s#", &filename, &filename_len))
    return NULL;

  ExifData* data = exif_data_new_from_file(filename);
  if (!data) Py_RETURN_NONE;

  ExifByteOrder byte_order = exif_data_get_byte_order(data);

  PyObject* py_dict = PyDict_New();

  for (ExifIfd ifd = 0; ifd < EXIF_IFD_COUNT; ifd++) {
    ExifContent* content = data->ifd[ifd];
    if (!content) continue;

    const char* ifd_name = exif_ifd_get_name(ifd);
    PyObject* py_entries = mirage_exif_ifd_entries_to_py(content, ifd, byte_order);
    PyDict_SetItemString(py_dict, ifd_name, py_entries);
    Py_DECREF(py_entries);
  }

  exif_data_unref(data);

  return py_dict;
}

PyMethodDef methods[] = {
  {"read_metadata", mirage_exif_read_metadata, METH_VARARGS},
  {NULL, NULL, 0},
};

void initexif(void) {
  Py_InitModule("exif", methods);
}
