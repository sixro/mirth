CC=gcc-15

RAYLIB_CFLAGS=$(shell pkg-config --cflags raylib)
CFLAGS=-Wall -Wextra -Werror -std=c99 $(RAYLIB_CFLAGS)
LDFLAGS=$(shell pkg-config --libs raylib)
LIBS=

PROG=mirth
SRCDIR=src
OBJDIR=build
BINDIR=bin
SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))

all: $(PROG)

$(PROG): $(OBJS)
	@echo Linking $@...
	@mkdir -p $(BINDIR)
	$(CC) $(OBJS) $(LDFLAGS) $(LIBS) -o $(BINDIR)/$@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@echo Compiling $<...
	@mkdir -p $(OBJDIR)
	@echo RayLib C Flags: $(RAYLIB_CFLAGS)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@echo Cleaning...
	@rm -rf $(OBJDIR)
	@rm -rf $(BINDIR)
