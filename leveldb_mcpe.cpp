//Rubisks trying to wrap leveldb-mcpe
#include <leveldb/cache.h>
#include <leveldb/comparator.h>
#include <leveldb/db.h>
#include <leveldb/env.h>
#include <leveldb/filter_policy.h>
#include <leveldb/write_batch.h>
#include <leveldb/zlib_compressor.h>
#define BOOST_PYTHON_STATIC_LIB
#define BOOST_SYSTEM_STATIC_LIB
#define BOOST_ALL_STATIC_LIB

#include <boost/python/module.hpp>
#include <boost/python/def.hpp>
#include <boost/python/object.hpp>
#include <boost/python/str.hpp>
#include <boost/python/extract.hpp>
#include <boost/system/config.hpp>
#include <boost/python.hpp>
#include <stdint.h>
#include <stdio.h>

namespace bp = boost::python;

//Exception
class LevelDBException {
public:
	LevelDBException(const std::string msg)
		: message(msg) {}

	std::string getMessage() const {
		return message;
	}
private:
	std::string message;
};

static void ExceptionTranslator(const LevelDBException &err) {
	PyErr_SetString(PyExc_RuntimeError, err.getMessage().c_str());
};

struct IteratorWrapper {
	leveldb::Iterator* _it;
	
	IteratorWrapper(leveldb::Iterator* it){
		this->_it = it;
	}

  ~IteratorWrapper()
  {
    delete _it;
  }

	bool Valid()
	{
		return this->_it->Valid();
	}

	void SeekToFirst()
	{
		this->_it->SeekToFirst();
	}

	void SeekToLast()
	{
		this->_it->SeekToLast();
	}

	void Seek(PyObject* _target)
	{
		const std::string target = bp::extract<const std::string>(_target);
		return this->_it->Seek(target);
	}

	void Next()
	{
		this->_it->Next();
	}

	void Prev()
	{
		this->_it->Prev();
	}
	
	std::string key()
	{
		return this->_it->key().ToString();
	}

	std::string value()
	{
		return this->_it->value().ToString();
	}

	void status()
	{
		leveldb::Status s = this->_it->status();

		if (!s.ok()){
			throw LevelDBException(s.ToString());
		}
	}
};

//write_batch.h
struct WriteBatchWrapper
{
	leveldb::WriteBatch* _wb;

	WriteBatchWrapper(){
		_wb = new leveldb::WriteBatch();
        }

  ~WriteBatchWrapper(){
    delete _wb;
  }

	void Put(PyObject* _key, PyObject* _value)
	{
		const std::string key = bp::extract<const std::string>(_key);
		const std::string value = bp::extract<const std::string>(_value);
		this->_wb->Put(key, value);
	}

	void Delete(PyObject* _key)
	{
		const std::string key = bp::extract<const std::string>(_key);
		this->_wb->Delete(key);
	}
};


//leveldb::DB wrapper
class DBWrap
{
public:
  leveldb::DB * _db;

  DBWrap(PyObject* _options, PyObject* _name) //Open(options, name, db)
    : _db(NULL)
  {
    leveldb::Options options = bp::extract<leveldb::Options&>(_options);
	options.compressors[0] = new leveldb::ZlibCompressor();
    std::string name = bp::extract<std::string>(_name);
    leveldb::Status s = leveldb::DB::Open(options, name, &_db);

    if(!s.ok())
    {
      throw LevelDBException(s.ToString());
    }
  }

  ~DBWrap()
  {
    delete _db;
  }

  void Put(PyObject* _options, PyObject* _key, PyObject* _value) //Put(options, key, value)
  {
	  const leveldb::WriteOptions& options = bp::extract<const leveldb::WriteOptions&>(_options);
	  const std::string key = bp::extract<const std::string>(_key);
	  const std::string value = bp::extract<const std::string>(_value);
	  leveldb::Status s = this->_db->Put(options, key, value);

	  if (!s.ok()){
		  throw LevelDBException(s.ToString());
	  }
  }

  void Delete(PyObject* _options, PyObject* _key) //Delete(options, key)
  {
	  const leveldb::WriteOptions& options = bp::extract<const leveldb::WriteOptions&>(_options);
	  const std::string key = bp::extract<const std::string>(_key);
	  leveldb::Status s = this->_db->Delete(options, key);

	  if (!s.ok()){
		  throw LevelDBException(s.ToString());
	  }
  }

  std::string Get(PyObject* _options, PyObject* _key) //Delete(options, key)
  {
	  const leveldb::ReadOptions& options = bp::extract<const leveldb::ReadOptions&>(_options);
	  const std::string key = bp::extract<const std::string>(_key);
	  std::string value;
	  leveldb::Status s = this->_db->Get(options, key, &value);

	  if (!s.ok()){
		  throw LevelDBException(s.ToString());
	  }
	  return value;
  }


  void Write(PyObject* _options, PyObject* _updates)
  {
	  const leveldb::WriteOptions& options = bp::extract<const leveldb::WriteOptions&>(_options);
	  WriteBatchWrapper& __updates = bp::extract<WriteBatchWrapper&>(_updates);
	  leveldb::Status s = this->_db->Write(options, __updates._wb);

	  if (!s.ok()){
		  throw LevelDBException(s.ToString());
	  }
  }


  IteratorWrapper* NewIterator(const leveldb::ReadOptions& options)
  {
	  leveldb::Iterator* it = this->_db->NewIterator(options);
	  return new IteratorWrapper(it);
  }

  const leveldb::Snapshot* GetSnapshot()
  {
	  return _db->GetSnapshot();
  }

  void GetApproximateSizes(const leveldb::Range* range, int n, uint64_t* sizes)
  {
    this->_db->GetApproximateSizes(range, n, sizes);
  }


  void ReleaseSnapshot(const leveldb::Snapshot* snapshot)
  {
    this->_db->ReleaseSnapshot(snapshot);
  }

  bool GetProperty(const leveldb::Slice& property, std::string* value)
  {
    return this->_db->GetProperty(property, value);
  }

  void CompactRange(const leveldb::Slice* begin, const leveldb::Slice* end)
  {
    this->_db->CompactRange(begin, end);
  }
};

class RepairWrapper{
public:
	~RepairWrapper(){};

	RepairWrapper(PyObject* _path, PyObject* _options)
	{
		const std::string path = bp::extract<const std::string>(_path);
		const leveldb::Options& options = bp::extract<const leveldb::Options&>(_options);
		leveldb::Status s = leveldb::RepairDB(path, options);

		if (!s.ok()){
			throw LevelDBException(s.ToString());
		}
	}
};

BOOST_PYTHON_MODULE(leveldb_mcpe)
{
  //Exceptions
  bp::register_exception_translator<LevelDBException>(&ExceptionTranslator);

  //leveldb/db.h
  bp::class_<DBWrap, boost::noncopyable>("DB", bp::init<PyObject*, PyObject*>())
    .def("Put", &DBWrap::Put)
    .def("Delete", &DBWrap::Delete)
    .def("Write", &DBWrap::Write)
    .def("Get", &DBWrap::Get)
    .def("NewIterator", &DBWrap::NewIterator, 
		bp::return_value_policy<bp::manage_new_object>())
    .def("GetSnapshot", &DBWrap::GetSnapshot,
		bp::return_value_policy<bp::reference_existing_object>())
    .def("ReleaseSnapshot", &DBWrap::ReleaseSnapshot)
    .def("GetProperty", &DBWrap::GetProperty)
	.def("GetApproximateSizes", &DBWrap::GetApproximateSizes)
	.def("CompactRange", &DBWrap::CompactRange);

  //leveldb/options.h
  bp::class_<leveldb::Options>("Options", bp::init<>())
	  //.def_readonly("comparator", &leveldb::Options::comparator) //Pointer, maybe needs better wrapper? Untested
	  .def_readwrite("create_if_missing", &leveldb::Options::create_if_missing)
	  .def_readwrite("error_if_exists", &leveldb::Options::error_if_exists)
	  //.def_readwrite("env", &leveldb::Options::env) //Pointer, maybe needs better wrapper? Untested
	  //.def_readwrite("info_log", &leveldb::Options::info_log) //Pointer, maybe needs better wrapper? Untested
	  .def_readwrite("write_buffer_size", &leveldb::Options::write_buffer_size)
	  .def_readwrite("max_open_files", &leveldb::Options::max_open_files)
	  //.def_readwrite("block_cache", &leveldb::Options::block_cache) //Pointer, maybe needs better wrapper? Untested
	  .def_readwrite("block_size", &leveldb::Options::block_size)
	  .def_readwrite("block_restart_interval", &leveldb::Options::block_restart_interval)
	  //TODO setup a way to include compressor array //Pointer, maybe needs better wrapper? Untested
	  //.def_readonly("filter_policy", &leveldb::Options::filter_policy); //Pointer, maybe needs better wrapper? Untested
	;
  
  bp::class_<leveldb::ReadOptions>("ReadOptions", bp::init<>())
	  .def_readwrite("verify_checksums", &leveldb::ReadOptions::verify_checksums)
	  .def_readwrite("fill_cache", &leveldb::ReadOptions::fill_cache)
	  .add_property("snapshot",
		bp::make_getter(&leveldb::ReadOptions::snapshot),
		bp::make_setter(&leveldb::ReadOptions::snapshot))
	;

  bp::class_<leveldb::WriteOptions>("WriteOptions", bp::init<>())
	  .def_readwrite("sync", &leveldb::WriteOptions::sync)
	;

  //leveldb/iterator.h
  bp::class_<IteratorWrapper, boost::noncopyable>("Iterator", bp::no_init)
	  .def("Valid", &IteratorWrapper::Valid)
	  .def("SeekToFirst", &IteratorWrapper::SeekToFirst)
	  .def("SeekToLast", &IteratorWrapper::SeekToLast)
	  .def("Seek", &IteratorWrapper::Seek)
	  .def("Next", &IteratorWrapper::Next)
	  .def("Prev", &IteratorWrapper::Prev)
	  .def("key", &IteratorWrapper::key)
	  .def("value", &IteratorWrapper::value)
	  .def("status", &IteratorWrapper::status)
	  ;

  //leveldb/write_batch.h
  bp::class_<WriteBatchWrapper>("WriteBatch", bp::init<>())
	  .def("Put", &WriteBatchWrapper::Put)
	  .def("Delete", &WriteBatchWrapper::Delete)
	  ;

  bp::class_<leveldb::Snapshot, boost::noncopyable>("Snapshot", bp::no_init);

  bp::class_<RepairWrapper>("RepairWrapper", bp::init<PyObject*, PyObject*>());
}
