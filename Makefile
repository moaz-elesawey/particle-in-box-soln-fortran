FC = gfortran
FCFLAGS = -c
FCLINKS = -g
LINKER = $(FC) -o
TARGET = PIB.exe
OBJS = main.o solver.o initializer.o parameters.o writer.o

SRC_DIR  = src
OBJ_DIR  = objs
MOD_DIR  = mods
EXEC_DIR = exec
VPATH	 = $(SRC_DIR)

all: $(TARGET)

$(TARGET): $(OBJS)
	@echo "creating executable file..."
	$(LINKER) $(TARGET) $(OBJS) $(FCLINKS)
	mv *.o   $(OBJ_DIR) ; true
	mv *.mod $(MOD_DIR) ; true
	mv *.exe $(EXEC_DIR); true

clean:
	rm -rf *.exe *.mod *.o *~
	rm -rf $(OBJ_DIR)/*.o    $(OBJ_DIR)/*~
	rm -rf $(EXEC_DIR)/*.exe $(EXEC_DIR)/*~
	rm -rf $(MOD_DIR)/*.mod  $(MOD_DIR)/*~

run:
	./$(EXEC_DIR)/$(TARGET)

%.o: %.f95
	@echo "compiling file $<"
	$(FC) $(FCFLAGS) $<

# dependencies chain
main.o 			: main.f95 solver.o writer.o initializer.o parameters.o
solver.o 		: solver.f95 initializer.o parameters.o
initializer.o	: initializer.f95 parameters.o
parameters.o	: parameters.f95
writer.o		: writer.f95


