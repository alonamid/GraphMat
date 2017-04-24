#MPICXX=mpiicpc
#CXX=icpc
MPICXX=mpic++
CXX=aarch64-linux-gnu-gcc

SRCDIR=./src
INCLUDEDIR=./include
DIST_PRIMITIVES_PATH=$(INCLUDEDIR)/GMDP
BINDIR=./bin

CATCHDIR=./test/Catch
TESTDIR=./test
TESTBINDIR=./testbin

ifeq (${CXX}, icpc)
  CXX_OPTIONS=-qopenmp -std=c++11
else
  CXX_OPTIONS=-fopenmp --std=c++11 -I/usr/include/mpi/
endif

CXX_OPTIONS+=-I$(INCLUDEDIR) -I$(DIST_PRIMITIVES_PATH) -I./gem5-util

CXX_OPTIONS+=-DON_ARM
ASM=./gem5-util/m5op_arm_A64.S

ifeq (${debug}, 1)
  CXX_OPTIONS += -O0 -g -D__DEBUG 
else
  ifeq (${CXX}, icpc)
    CXX_OPTIONS += -O3 -ipo 
  else
    CXX_OPTIONS += -O3 -flto -fwhole-program
  endif
endif

ifeq (${CXX}, icpc)
  CXX_OPTIONS += -xHost
endif

ifeq (${timing}, 1)
  CXX_OPTIONS += -D__TIMING
else
endif

LD_OPTIONS += -lboost_serialization

# --- Apps --- #
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

include_headers = $(wildcard $(INCLUDEDIR)/*.h)
dist_primitives_headers = $(wildcard $(DIST_PRIMITIVES_PATH)/*.h $(DIST_PRIMITIVES_PATH)/*/*.h)
DEPS = $(include_headers) $(dist_primitives_headers)

#APPS=$(BINDIR)/graph_converter $(BINDIR)/PageRank $(BINDIR)/IncrementalPageRank $(BINDIR)/BFS $(BINDIR)/SSSP $(BINDIR)/LDA $(BINDIR)/SGD $(BINDIR)/TriangleCounting #$(BINDIR)/DS
APPS=$(BINDIR)/graph_converter $(BINDIR)/PageRank $(BINDIR)/BFS

all: $(APPS)  
	
$(BINDIR)/% : $(SRCDIR)/%.cpp $(DEPS) $(ASM) 
	$(MPICXX) $(CXX_OPTIONS) -o $@ $< $(ASM) $(LD_OPTIONS)

# --- Test --- #
test: $(TESTBINDIR)/test 
test_headers = $(wildcard $(TESTDIR)/*.h)
test_src = $(wildcard $(TESTDIR)/*.cpp)
test_objects = $(patsubst $(TESTDIR)/%.cpp, $(TESTBINDIR)/%.o, $(test_src))

$(TESTBINDIR)/%.o : $(TESTDIR)/%.cpp $(DEPS) $(test_headers) $(ASM) 
	$(MPICXX) $(CXX_OPTIONS) -I$(CATCHDIR)/include -c $< -o $@ $(ASM) $(LD_OPTIONS)

$(TESTBINDIR)/test: $(test_objects) $(ASM)
	$(MPICXX) $(CXX_OPTIONS) -I$(CATCHDIR)/include -o $(TESTBINDIR)/test $(test_objects) $(ASM) $(LD_OPTIONS)

# --- clean --- #

clean:
	rm -f $(APPS) $(TESTBINDIR)/test $(test_objects)
