SRC = src
BIN = bin

#list source manually to exclude sim.cpp and simmulti.cpp
SOURCE = Gobbi.cpp scalerBuf.cpp histo.cpp HINP.cpp silicon.cpp elist.cpp solution.cpp pid.cpp ZApar.cpp einstein.cpp losses.cpp loss2.cpp correl2.cpp parType.cpp calibrate.cpp
#$(patsubst pattern,replacement,text), this variable has all the object files in directory bin/filename.o
#substitution reference $(var:pattern=replacement)
OBJECT = $(patsubst %, $(BIN)/%, $(notdir $(SOURCE:.cpp=.o)))

CC = g++
CFLAGS= -c -std=c++17 -I$(shell root-config --incdir)
LINKOPTION = $(shell root-config --libs) 

sort : $(BIN)/sort.o $(OBJECT)
	@echo "Linking..."
	$(CC) -o $@ $^ $(LINKOPTION)
	@echo "Finished"
	
$(BIN)/%.o : $(SRC)/%.cpp
	@echo "Compiling..."
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(BIN)/*.o
	rm -f sort

print:
	@echo $(OBJECT)
	@echo $(SOURCE)
	
