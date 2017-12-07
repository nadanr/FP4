#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main (int argc, char *argv[]){
	char buf[512];
	int r ,fs , ft , w = 0; 
	int fds , fdt;
	
	if(argc < 3){
	printf(2 , "copy : Minimal 2 argumen\n");
	exit();
	}
	else if (argc > 1 && argv[1][0] == '-' && (argv[1][1] == 'R' || argv[1][1] == 'r' )){
		struct stat st;
		struct stat st2;
		fds = open(argv[2] ,  O_RDONLY);
		fstat(fds, &st);
		fdt = open(argv[3] ,  O_RDONLY);
		
		if(st.type != T_DIR){
			printf(1 , "copy : sumber bukan direktori\n");
			exit();
			}
		if (fds < 0 ) {
				printf(1,"copy : Tidak dapat membuka sumber %s\n",argv[2]);
				exit();
			}
		if (fdt < 0 ) {
			close(fdt);
			mkdir(argv[3]);
				
			}
		fstat(fdt, &st2);
		if (st2.type != T_DIR){
				printf(1 , "copy : tujuan bukan direktori\n");
				exit();
			}
		
		if (st.type == T_DIR && st2.type == T_DIR){
				printf(1 , "copy : HEHEHE\n");
				exit();


			}
	}
	else if (argc > 1 && argv[1][0] == '*'){
		if ( link(argv[2], argv[3]) < 0){
		printf(1 , "copy : LOL\n");
		}
				exit();

	}else if (argc > 1) {


  		if ((fs = open(argv[1], O_RDONLY)) < 0) {
    		printf(2, "copy: Tidak dapat membuka sumber %s\n", argv[1]);
    		exit();
  		}

		  if ((ft = open(argv[2], O_CREATE|O_WRONLY)) < 0) {
    		printf(2, "copy: Tisak dapat membuka tujuan %s\n", argv[2]);
    		exit();
 		 }
  
  	while ((r = read(fs, buf, sizeof(buf))) > 0) {
  	  w = write(ft, buf, r);
  	  if (w != r || w < 0) 
      break;
 	 }
  	if (r < 0 || w < 0)
    	printf(2, "copy: error copying %s to %s\n", argv[1], argv[2]);

  close(fs);
  close(ft);

exit();
	}
}
