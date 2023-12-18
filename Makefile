# Define compiler and flags
CXX = g++
CXXFLAGS = -std=c++23 -Wall

# Define directories
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# Find all source files
SRCS := $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(SRC_DIR)/*/*.cpp)

# Create object file names by replacing src directory with build directory
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Set the target executable
TARGET = $(BIN_DIR)/game

# Specify libraries
LIBS = -lglfw -lGLEW -lGL -lGLU -lglut -lm

# Build the executable
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

# Build object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Clean up build artifacts
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Specify phony targets
.PHONY: all clean

# Default target
all: $(TARGET)
