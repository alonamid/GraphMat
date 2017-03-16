#ifndef TRACE_H
#define TRACE_H

#define DO_TRACE

#if defined(DO_TRACE)

	// constant settings
	static constexpr bool EmitHumanReadable = false;

// essential macros
#define TRACE_OPEN(filename) trace_open(filename)
#define TRACE_FINISH() trace_finish()
#define TRACE_PROP(name, value) trace_prop((name), (value))

#include <iostream>
#include <fstream>


static std::ofstream trace_out;


typedef uint32_t trace_edge_t;
typedef uint32_t trace_vertex_t;
typedef uint32_t trace_prop_t;
typedef uint32_t trace_weight_t;
typedef uint64_t addr_t;

static inline void trace_open(const char* filename) {
	trace_out.open(filename, std::ofstream::out);
}

static inline void trace_finish() {
	trace_out.close();
}

typedef uint32_t IdType; // goes up to about 4 billion

enum class DataType : uint8_t { Edge, Vertex, Property, Weight, Aux };
static inline const char* to_string(DataType tt) {
	switch (tt) {
	case DataType::Edge: return "E";
	case DataType::Vertex: return "V";
	case DataType::Property: return "P";
	case DataType::Weight: return "W";
	case DataType::Aux: return "A";
	default: return "?";
	}
}

enum class AccessType : uint8_t { Read, ReadWrite, Write };
static inline const char* to_string(AccessType tt) {
	switch (tt) {
	case AccessType::Read: return "r";
	case AccessType::ReadWrite: return "rw";
	case AccessType::Write: return "w";
	default: return "?";
	}
}

template<typename T>
static inline void TRACE_VERTEX_READ(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Vertex, AccessType::Read, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_VERTEX_READ(IdType id, T* start_addr) {
	trace_access(DataType::Vertex, AccessType::Read, (id), start_addr);
}


template<typename T>
static inline void TRACE_VERTEX_WRITE(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Vertex, AccessType::Write, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_VERTEX_WRITE(IdType id, T* start_addr) {
	trace_access(DataType::Vertex, AccessType::Write, (id), start_addr);
}


template<typename T>
static inline void TRACE_VERTEX_RW(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Vertex, AccessType::ReadWrite, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_VERTEX_RW(IdType id, T* start_addr) {
	trace_access(DataType::Vertex, AccessType::ReadWrite, (id), start_addr);
}


template<typename T>
static inline void TRACE_PROP_READ(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Property, AccessType::Read, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_PROP_READ(IdType id, T* start_addr) {
	trace_access(DataType::Property, AccessType::Read, (id), start_addr);
}


template<typename T>
static inline void TRACE_PROP_WRITE(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Property, AccessType::Write, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_PROP_WRITE(IdType id, T* start_addr) {
	trace_access(DataType::Property, AccessType::Write, (id), start_addr);
}


template<typename T>
static inline void TRACE_PROP_RW(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Property, AccessType::ReadWrite, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_PROP_RW(IdType id, T* start_addr) {
	trace_access(DataType::Property, AccessType::ReadWrite, (id), start_addr);
}



template<typename T>
static inline void TRACE_EDGE_READ(IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	trace_access(DataType::Edge, AccessType::Read, id1, id2, start_addr, size);
}

template<typename T>
static inline void TRACE_EDGE_READ(IdType id1, IdType id2, T* start_addr) {
	trace_access(DataType::Edge, AccessType::Read, id1, id2, start_addr);
}


template<typename T>
static inline void TRACE_EDGE_WRITE(IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	trace_access(DataType::Edge, AccessType::Write, id1, id2, start_addr, size);
}


template<typename T>
static inline void TRACE_EDGE_WRITE(IdType id1, IdType id2, T* start_addr) {
	trace_access(DataType::Edge, AccessType::Write, id1, id2, start_addr);
}


template<typename T>
static inline void TRACE_EDGE_RW(IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	trace_access(DataType::Edge, AccessType::ReadWrite, id1, id2, start_addr, size);
}


template<typename T>
static inline void TRACE_EDGE_RW(IdType id1, IdType id2, T* start_addr) {
	trace_access(DataType::Edge, AccessType::ReadWrite, id1, id2, start_addr);
}


template<typename T>
static inline void TRACE_WEIGHT_READ(IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	trace_access(DataType::Weight, AccessType::Read, id1, id2, start_addr, size);
}


template<typename T>
static inline void TRACE_WEIGHT_READ(IdType id1, IdType id2, T* start_addr) {
	trace_access(DataType::Weight, AccessType::Read, id1, id2, start_addr);
}


template<typename T>
static inline void TRACE_WEIGHT_WRITE(IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	trace_access(DataType::Weight, AccessType::Write, id1, id2, start_addr, size);
}


template<typename T>
static inline void TRACE_WEIGHT_WRITE(IdType id1, IdType id2, T* start_addr) {
	trace_access(DataType::Weight, AccessType::Write, id1, id2, start_addr);
}


template<typename T>
static inline void TRACE_WEIGHT_RW(IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	trace_access(DataType::Weight, AccessType::ReadWrite, id1, id2, start_addr, size);
}

template<typename T>
static inline void TRACE_WEIGHT_RW(IdType id1, IdType id2, T* start_addr) {
	trace_access(DataType::Weight, AccessType::ReadWrite, id1, id2, start_addr);
}


template<typename T>
static inline void TRACE_AUX_READ(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Aux, AccessType::Read, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_AUX_READ(IdType id, T* start_addr) {
	trace_access(DataType::Aux, AccessType::Read, (id), start_addr);
}


template<typename T>
static inline void TRACE_AUX_WRITE(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Aux, AccessType::Write, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_AUX_WRITE(IdType id, T* start_addr) {
	trace_access(DataType::Aux, AccessType::Write, (id), start_addr);
}


template<typename T>
static inline void TRACE_AUX_RW(IdType id, T* start_addr, long unsigned int size) {
	trace_access(DataType::Aux, AccessType::ReadWrite, (id), start_addr, size);
}


template<typename T>
static inline void TRACE_AUX_RW(IdType id, T* start_addr) {
	trace_access(DataType::Aux, AccessType::ReadWrite, (id), start_addr);
}

template<typename T>
static inline void trace_access(DataType data, AccessType access, IdType id, T* start_addr) {
	trace_access(data, access, id, start_addr, sizeof(T));
}


template<typename T>
static inline void trace_access(DataType data, AccessType access, IdType id1, IdType id2, T* start_addr) {
	trace_access(data, access, id1, id2, start_addr, sizeof(T));
}

////////////////////////////////////////////////////////////////////////////////
// trace format definition
////////////////////////////////////////////////////////////////////////////////
static inline void dump_entry(DataType data, AccessType access, IdType id1, IdType id2, const void* start_addr, uint16_t size);

template<typename T>
static inline void trace_access(DataType data, AccessType access, IdType id, T* start_addr, long unsigned int size) {
	static_assert(sizeof(T*) == sizeof(void*), "all pointers need to be of equal size");
	if (EmitHumanReadable) {
		trace_out << to_string(data) << "," << id << "," << start_addr << "," << size << std::endl;
	}
	else {
		dump_entry(data, access, id, 0, start_addr, size);
	}
}

template<typename T>
static inline void trace_access(DataType data, AccessType access, IdType id1, IdType id2, T* start_addr, long unsigned int size) {
	static_assert(sizeof(T*) == sizeof(void*), "all pointers need to be of equal size");
	if (EmitHumanReadable) {
		trace_out << to_string(data) << ",<" << id1 << " " << id2 << ">," << start_addr << "," << size << std::endl;
	}
	else {
		dump_entry(data, access, id1, id2, start_addr, size);
	}
}

template<typename T>
static inline void trace_prop(const char* name, const T& value) {
	if (EmitHumanReadable) {
		trace_out << name << "=" << value << std::endl;
	}
	else {
		// TODO: currently ignored for binary, do we need this info?
	}
}


// binary
struct Entry {
	const void*  start_addr;
	IdType id1;
	IdType id2;
	uint16_t size;
	DataType data;
	AccessType access;
} __attribute__((packed));

static inline void dump_entry(DataType data, AccessType access, IdType id1, IdType id2, const void* start_addr, uint16_t size) {
	Entry e{ start_addr, id1, id2, size, data, access };
	trace_out.write(reinterpret_cast<char*>(&e), sizeof(Entry));
}


#else

#define TRACE_OPEN(filename)
#define TRACE_FINISH()
#define TRACE_PROP(name, value)
#define TRACE_VERTEX_READ(id)
#define TRACE_VERTEX_WRITE(id)
#define TRACE_EDGE_READ(id)
#define TRACE_EDGE_WRITE(id)

#endif


	// short hands / constants
#define TRACE_LOAD_GRAPH_VERTEX_COUNT(n) TRACE_PROP("vertex_count", n)
#define TRACE_LOAD_GRAPH_EDGE_COUNT(m) TRACE_PROP("edge_count", m)


#endif // TRACE_H