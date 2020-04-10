CC       = g++
FLAGS    = -std=c++11 -g  
LIBS     = -l<libname> 
LIBDIRS  = -L/usr/local/lib -L$(PWD)/lib
INC      = -I$(PWD)/include -I<path//to/other/lib>

TARGET = bin/<mybinaryfile>

SRCDIR  = $(PWD)/src
SRCEXT  = cpp

INCLUDEDIR   = $(PWD)/include
LIBDIR 	     = $(PWD)/lib
BUILDDIR     = $(PWD)/build
EXTERNALDIR  = $(PWD)/external/

SOURCES = $(shell find $(SRCDIR) -xtype f -name "*".$(SRCEXT))
OBJECTS = $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

$(info $(SOURCES))
$(info $(OBJECTS))

$(TARGET): $(OBJECTS)
	$$(CC) -o $@ $^  $(FLAGS) $(INC) $(LIBDIRS) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	$(CC) -c -o $@ $< $(FLAGS) $(INC) $(LIBDIRS) $(LIBS)

.PHONY: clean
clean:
	$(RM) -r $(BUILDDIR) $(TARGET)
