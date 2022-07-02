FC = f95
LINKER = $(FC) -o
FC_FLAGS = -c -O3 -mcmodel=medium
FC_LINKS = -g -Wall -O3 -mcmodel=medium
NC_FLAGS = -lnetcdff -lcurl
NC_INC = -I/usr/local/include
NC_LIB = -L/usr/local/lib

TARGET = PIB.exe
OBJS = main.o solver.o initializer.o parameters.o writer.o

SRC_DIR = src
OBJ_DIR = objs
MOD_DIR = mods
BIN_DIR = bin
VPATH = $(SRC_DIR)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LINKER) $(TARGET) $(OBJS) $(NC_INC) $(NC_LIB) $(NC_FLAGS) $(FC_LINKS)
	mv *.o $(OBJ_DIR)
	mv *.mod $(MOD_DIR)
	mv *.exe $(BIN_DIR)

clean:
	rm -rf *.exe *.mod *.o *~
	rm -rf $(OBJ_DIR)/*.o $(OBJ_DIR)/*~
	rm -rf $(MOD_DIR)/*.mod $(MOD_DIR)/*~
	rm -rf $(BIN_DIR)/*.exe $(BIN_DIR)/*~

run:
	./$(BIN_DIR)/$(TARGET)

%.o: %.f95
	$(FC) $(FC_FLAGS) $<

writer.o: src/writer.f95
	$(FC) $(FC_FLAGS) src/writer.f95 $(NC_INC) $(NC_LIB) $(NC_FLAGS)

# dependencies chain
main.o 			: main.f95 solver.o writer.o initializer.o parameters.o
solver.o 		: solver.f95 initializer.o parameters.o
initializer.o	: initializer.f95 parameters.o
parameters.o	: parameters.f95


