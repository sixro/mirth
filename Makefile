CC=gcc-15

CFLAGS=-Wall -Wextra -std=c89
LDFLAGS=
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
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@echo Cleaning...
	@rm -rf $(OBJDIR)
	@rm -rf $(BINDIR)
