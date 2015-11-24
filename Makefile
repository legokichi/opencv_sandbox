CXX = g++ -std=c++14
CXXFLAGS = -O0 -Wall `pkg-config opencv --cflags` `pkg-config opencv --libs`
INCLUDE = -I./include
ODIR = ./obj
SDIR = ./src
DIST = ./bin
SRCS = $(wildcard ./src/*.cpp)
OBJS = $(SRCS:./src/%.cpp=./obj/%.o)
TARGET = $(DIST)/a.out

all : $(TARGET)

$(TARGET): $(OBJS)
	if [ ! -d $(DIST) ]; then mkdir $(DIST); fi
	$(CXX) -o $@ $^

$(ODIR)/%.o: $(SDIR)/%.cpp
	if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ -c $<

run:
	./bin/a.out LoremIpsum.txt

.PHONY: clean
clean:
	rm -rf $(ODIR) $(DIST) $(LLVMDIR)
