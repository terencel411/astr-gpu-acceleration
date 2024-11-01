# Compiler
FC = nvfortran

# Executable files
EXEC1 = tgv_cpu
EXEC2 = tgv_gpu
EXEC3 = time_stats

# Flags
FLAGS = -O3

SRC1 = tgvsolver_cpu_v3.f90
SRC2 = tgvsolver_gpu_v3.cuf
SRC3 = compstats.f90

# all: $(EXEC1) $(EXEC2) $(EXEC3)
all: cpu gpu compare

# Compile
# nvfortran -O3 tgvsolver.cuf -o tgv
# $^ is the source file
# $@ is the exec file

# $(EXEC1): $(SRC1)
# 	$(FC) $^ -o $@

cpu: $(SRC1)
	$(FC) -O3 $^ -o $(EXEC1)
	./$(EXEC1)

gpu: $(SRC2)
	$(FC) -O3 $^ -o $(EXEC2)
	./$(EXEC2)

compare: $(SRC3)
	$(FC) $^ -o $(EXEC3)
	./$(EXEC3)

clean:
	rm -f $(EXEC1) $(EXEC2) $(EXEC2)

# Phony targets
.PHONY: all clean cpu gpu compare
