#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main (int argc, char *argv[]){
	if(argc < 2){
		printf(1, "cd : argumen kurang");
		exit();
		}
	else {
		struct stat st;
		fstat(fds, &st);
		if(st.type != T_DIR){
			printf(1 , "copy : sumber bukan direktori\n");
			exit();
			}
	}
	printf(1, "cd : memasuki %s", argv[1]);
	chdir(argv[1]);
	}
	exit(); 
}
