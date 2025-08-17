CC=gcc-15

# In this project I am using Raylib which is written in C99.
# Because I want my code to be written in C89, I put all the code that uses
# Raylib inside a ui.c (for the UI, there could be other files in the 
# future). Those files that include "raylib.h" will be compiled using C99,
# while all the other files will be compiled with C89.

RAYLIB_CFLAGS=$(shell pkg-config --cflags raylib)
CFLAGS_BASE=-Wall -Wextra -Werror $(RAYLIB_CFLAGS)
CFLAGS=$(CFLAGS_BASE) -std=c89
CFLAGS_C99=$(CFLAGS_BASE) -std=c99

LDFLAGS=$(shell pkg-config --libs raylib)

LIBS=

PROG=mirth
SRCDIR=src
OBJDIR=build
BINDIR=bin

# Here the SRCS_C99 is valued manually with all c files that require C99.
# SRCS is automatically valued by escluding SRCS_C99 files from all c files
# found in the project
ALL_SRCS=$(wildcard $(SRCDIR)/*.c)
SRCS_C99=$(SRCDIR)/ui.c
SRCS=$(filter-out $(SRCS_C99), $(ALL_SRCS))

OBJS=$(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))
OBJS_C99=$(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS_C99))

all: $(PROG)

# Here linking is independent from C89 and C99 so we simply add all .o files
$(PROG): $(OBJS) $(OBJS_C99)
	@echo Linking $@...
	@mkdir -p $(BINDIR)
	$(CC) $(OBJS) $(OBJS_C99) $(LDFLAGS) $(LIBS) -o $(BINDIR)/$@

# Here we compile all c files that are compatible with C89
$(OBJS): $(SRCS)
	@echo SRCS ......: $(SRCS)
	@echo SRCS_C99 ..: $(SRCS_C99)
	@echo OBJS_C99 ..: $(OBJS_C99)
	@echo Compiling $<...
	@mkdir -p $(OBJDIR)
	@echo RayLib C Flags: $(RAYLIB_CFLAGS)
	$(CC) $(CFLAGS) -c -o $@ $<

# Here we compile all c files that are compatible with C99
$(OBJS_C99): $(SRCS_C99)
	@echo Compiling source requiring c99: $<...
	@mkdir -p $(OBJDIR)
	@echo RayLib C Flags: $(RAYLIB_CFLAGS)
	$(CC) $(CFLAGS_C99) -c -o $@ $<

clean:
	@echo Cleaning...
	@rm -rf $(OBJDIR)
	@rm -rf $(BINDIR)
