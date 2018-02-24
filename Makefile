INCLUDES 	 = -I./include/

COMPILE_OPTS = $(INCLUDES)  -O2 -g
C 			 = c
C_COMPILER   = cc
C_FLAGS 	 = $(COMPILE_OPTS) $(CPPFLAGS) $(CFLAGS)
CPP 		 = cpp
CPLUSPLUS_COMPILER =    c++
CPLUSPLUS_FLAGS = $(COMPILE_OPTS) -Wall -Wno-unused-but-set-variable  $(CPPFLAGS) $(CXXFLAGS)
OBJ 		 =           o
LINK 		 =  c++ -o
LINK_OPTS    =  
CONSOLE_LINK_OPTS = $(LINK_OPTS) -lpthread -lssl -lcrypto -lrtmp
LINK_OBJ	 = simplest_librtmp_send264.o librtmp_send264.o

APP = test

.$(C).$(OBJ):
	$(C_COMPILER) -c $(C_FLAGS) $<
.$(CPP).$(OBJ):
	$(CPLUSPLUS_COMPILER) -c $(CPLUSPLUS_FLAGS) $<

$(APP): $(LINK_OBJ)
	$(LINK)$@  $(LINK_OBJ)  $(CONSOLE_LINK_OPTS)
	
clean:
	-rm -rf *.$(OBJ) $(APP) core *.core *~ include/*~

