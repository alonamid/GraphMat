#ifndef TRACE_HPP
#define TRACE_HPP

#define DO_TRACE

#if defined(DO_TRACE)

// essential macros
#define TRACE_OPEN(filename) trace_open(filename)
#define TRACE_FINISH() trace_finish()
#define TRACE_PROP(name, value) trace_prop((name), (value))
#define TRACE_VERTEX_READ(id,start_addr,size)       trace_access(DataType::Vertex,   AccessType::Read, (id),start_addr,size)
#define TRACE_VERTEX_RW(id,start_addr,size)         trace_access(DataType::Vertex,   AccessType::ReadWrite, (id),start_addr,size)
#define TRACE_VERTEX_WRITE(id,start_addr,size)      trace_access(DataType::Vertex,   AccessType::Write, (id),start_addr,size)
#define TRACE_EDGE_READ(id1,id2,start_addr,size)    trace_access(DataType::Edge,     AccessType::Read, id1,id2,start_addr,size)
#define TRACE_EDGE_WRITE(id1,id2,start_addr,size)   trace_access(DataType::Edge,     AccessType::Write, id1,id2,start_addr,size)
#define TRACE_EDGE_RW(id1,id2,start_addr,size)      trace_access(DataType::Edge,     AccessType::ReadWrite, id1,id2,start_addr,size)
#define TRACE_WEIGHT_READ(id1,id2,start_addr,size)  trace_access(DataType::Weight,   AccessType::Read, id1,id2,start_addr,size)
#define TRACE_WEIGHT_WRITE(id1,id2,start_addr,size) trace_access(DataType::Weight,   AccessType::Write, id1,id2,start_addr,size)
#define TRACE_WEIGHT_RW(id1,id2,start_addr,size)    trace_access(DataType::Weight,   AccessType::ReadWrite, id1,id2,start_addr,size)
#define TRACE_PROP_READ(id,start_addr,size)         trace_access(DataType::Property, AccessType::Read, (id),start_addr,size)
#define TRACE_PROP_WRITE(id,start_addr,size)        trace_access(DataType::Property, AccessType::Write, (id),start_addr,size)
#define TRACE_PROP_RW(id,start_addr,size)           trace_access(DataType::Property, AccessType::ReadWrite, (id),start_addr,size)
#define TRACE_AUX_READ(id,start_addr,size)          trace_access(DataType::Aux, AccessType::Read, (id),start_addr,size)
#define TRACE_AUX_WRITE(id,start_addr,size)         trace_access(DataType::Aux, AccessType::Write, (id),start_addr,size)
#define TRACE_AUX_RW(id,start_addr,size)            trace_access(DataType::Aux, AccessType::ReadWrite, (id),start_addr,size)

#include <iostream>
#include <fstream>


static std::ofstream trace_out;

static inline void trace_open(const char* filename) {
	trace_out.open(filename, std::ofstream::out);
}

static inline void trace_finish() {
	trace_out.close();
}

template<typename T>
static inline void trace_prop(const char* name, const T& value) {
	trace_out << name << "=" << value << std::endl;
}


typedef uint64_t trace_edge_t;
typedef uint64_t trace_vertex_t;
typedef uint64_t trace_prop_t;
typedef uint64_t trace_weight_t;
typedef uint64_t addr_t;


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

typedef uint64_t IdType;
// TODO: trace address range
template<typename T>
static inline void trace_access(DataType data, AccessType access, IdType& id, T* start_addr, long unsigned int size) {
	trace_out << to_string(data) << "," << to_string(access) << "," << id << "," << start_addr << "," << size << std::endl;
}

template<typename T>
static inline void trace_access(DataType data, AccessType access, IdType& id1, IdType& id2, T* start_addr, long unsigned int size) {
	trace_out << to_string(data) << "," << to_string(access) << ",<" << id1 << " " << id2 << ">," << start_addr << "," << size << std::endl;
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


#endif // TRACE_HPP