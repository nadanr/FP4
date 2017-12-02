#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main (int argc, char *argv[]){
	char buf[512];
	int r ,fs , ft;
	
	if(argc < 3){
	printf(2 , "copy : Minimal 2 argumen");
	exit();
	}

	if((fs = open(argv[1] , O_RDONLY)) < 0){
	printf(2, "copy : Tidak dapat membuka sumber %s\n", argv[1]);
	exit();
	}

	if((ft = open(argv[2] , O_CREATE|O_WRONLY)) < 0 ){
	printf(2, "copy : Tidak dapat membuka tujuan %s\n", argv[2]);
	exit();
	}

	while((r = read(fs,buf, sizeof(buf))) > 0){
	printf(ft, "%s" , buf );
	}

	if(r < 0){
	printf(2, "copy : gagal\n");
	exit();
	}

}
