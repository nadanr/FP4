
_cp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main (int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 38 02 00 00    	sub    $0x238,%esp
	char buf[512];
	int r ,fs , ft , w = 0; 
	int fds , fdt;
	
	if(argc < 3){
  17:	83 39 02             	cmpl   $0x2,(%ecx)
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main (int argc, char *argv[]){
  1a:	8b 41 04             	mov    0x4(%ecx),%eax
  1d:	89 85 bc fd ff ff    	mov    %eax,-0x244(%ebp)
	char buf[512];
	int r ,fs , ft , w = 0; 
	int fds , fdt;
	
	if(argc < 3){
  23:	0f 8e ed 01 00 00    	jle    216 <main+0x216>
	printf(2 , "copy : Minimal 2 argumen\n");
	exit();
	}
	else if (argc > 1 && argv[1][0] == '-' && (argv[1][1] == 'R' || argv[1][1] == 'r' )){
  29:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
  2f:	8b 40 04             	mov    0x4(%eax),%eax
  32:	0f b6 10             	movzbl (%eax),%edx
  35:	80 fa 2d             	cmp    $0x2d,%dl
  38:	0f 84 d0 00 00 00    	je     10e <main+0x10e>
				exit();


			}
	}
	else if (argc > 1 && argv[1][0] == '*'){
  3e:	80 fa 2a             	cmp    $0x2a,%dl
  41:	0f 84 e2 01 00 00    	je     229 <main+0x229>
				exit();

	}else if (argc > 1) {


  		if ((fs = open(argv[1], O_RDONLY)) < 0) {
  47:	56                   	push   %esi
  48:	56                   	push   %esi
  49:	6a 00                	push   $0x0
  4b:	50                   	push   %eax
  4c:	e8 f1 04 00 00       	call   542 <open>
  51:	83 c4 10             	add    $0x10,%esp
  54:	85 c0                	test   %eax,%eax
  56:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
  5c:	0f 88 38 02 00 00    	js     29a <main+0x29a>
    		printf(2, "copy: Tidak dapat membuka sumber %s\n", argv[1]);
    		exit();
  		}

		  if ((ft = open(argv[2], O_CREATE|O_WRONLY)) < 0) {
  62:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
  68:	51                   	push   %ecx
  69:	51                   	push   %ecx
  6a:	68 01 02 00 00       	push   $0x201
  6f:	ff 70 08             	pushl  0x8(%eax)
  72:	e8 cb 04 00 00       	call   542 <open>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	85 c0                	test   %eax,%eax
  7c:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%ebp)
  82:	0f 88 40 01 00 00    	js     1c8 <main+0x1c8>
  88:	31 ff                	xor    %edi,%edi
  8a:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
  90:	eb 26                	jmp    b8 <main+0xb8>
  92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    		printf(2, "copy: Tisak dapat membuka tujuan %s\n", argv[2]);
    		exit();
 		 }
  
  	while ((r = read(fs, buf, sizeof(buf))) > 0) {
  	  w = write(ft, buf, r);
  98:	83 ec 04             	sub    $0x4,%esp
  9b:	56                   	push   %esi
  9c:	53                   	push   %ebx
  9d:	ff b5 c0 fd ff ff    	pushl  -0x240(%ebp)
  a3:	e8 7a 04 00 00       	call   522 <write>
  	  if (w != r || w < 0) 
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	39 c6                	cmp    %eax,%esi
    		printf(2, "copy: Tisak dapat membuka tujuan %s\n", argv[2]);
    		exit();
 		 }
  
  	while ((r = read(fs, buf, sizeof(buf))) > 0) {
  	  w = write(ft, buf, r);
  ad:	89 c7                	mov    %eax,%edi
  	  if (w != r || w < 0) 
  af:	75 24                	jne    d5 <main+0xd5>
  b1:	c1 e8 1f             	shr    $0x1f,%eax
  b4:	84 c0                	test   %al,%al
  b6:	75 1d                	jne    d5 <main+0xd5>
		  if ((ft = open(argv[2], O_CREATE|O_WRONLY)) < 0) {
    		printf(2, "copy: Tisak dapat membuka tujuan %s\n", argv[2]);
    		exit();
 		 }
  
  	while ((r = read(fs, buf, sizeof(buf))) > 0) {
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	53                   	push   %ebx
  c1:	ff b5 c4 fd ff ff    	pushl  -0x23c(%ebp)
  c7:	e8 4e 04 00 00       	call   51a <read>
  cc:	83 c4 10             	add    $0x10,%esp
  cf:	85 c0                	test   %eax,%eax
  d1:	89 c6                	mov    %eax,%esi
  d3:	7f c3                	jg     98 <main+0x98>
  	  w = write(ft, buf, r);
  	  if (w != r || w < 0) 
      break;
 	 }
  	if (r < 0 || w < 0)
  d5:	89 f2                	mov    %esi,%edx
  d7:	c1 ea 1f             	shr    $0x1f,%edx
  da:	84 d2                	test   %dl,%dl
  dc:	0f 85 c6 00 00 00    	jne    1a8 <main+0x1a8>
  e2:	89 f9                	mov    %edi,%ecx
  e4:	c1 e9 1f             	shr    $0x1f,%ecx
  e7:	84 c9                	test   %cl,%cl
  e9:	0f 85 b9 00 00 00    	jne    1a8 <main+0x1a8>
    	printf(2, "copy: error copying %s to %s\n", argv[1], argv[2]);

  close(fs);
  ef:	83 ec 0c             	sub    $0xc,%esp
  f2:	ff b5 c4 fd ff ff    	pushl  -0x23c(%ebp)
  f8:	e8 2d 04 00 00       	call   52a <close>
  close(ft);
  fd:	58                   	pop    %eax
  fe:	ff b5 c0 fd ff ff    	pushl  -0x240(%ebp)
 104:	e8 21 04 00 00       	call   52a <close>

exit();
 109:	e8 f4 03 00 00       	call   502 <exit>
	
	if(argc < 3){
	printf(2 , "copy : Minimal 2 argumen\n");
	exit();
	}
	else if (argc > 1 && argv[1][0] == '-' && (argv[1][1] == 'R' || argv[1][1] == 'r' )){
 10e:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 112:	83 e2 df             	and    $0xffffffdf,%edx
 115:	80 fa 52             	cmp    $0x52,%dl
 118:	0f 85 29 ff ff ff    	jne    47 <main+0x47>
		struct stat st;
		struct stat st2;
		fds = open(argv[2] ,  O_RDONLY);
 11e:	8b 9d bc fd ff ff    	mov    -0x244(%ebp),%ebx
 124:	51                   	push   %ecx
 125:	51                   	push   %ecx
 126:	6a 00                	push   $0x0
 128:	ff 73 08             	pushl  0x8(%ebx)
 12b:	e8 12 04 00 00       	call   542 <open>
		fstat(fds, &st);
 130:	5f                   	pop    %edi
	exit();
	}
	else if (argc > 1 && argv[1][0] == '-' && (argv[1][1] == 'R' || argv[1][1] == 'r' )){
		struct stat st;
		struct stat st2;
		fds = open(argv[2] ,  O_RDONLY);
 131:	89 c6                	mov    %eax,%esi
		fstat(fds, &st);
 133:	58                   	pop    %eax
 134:	8d 85 d4 fd ff ff    	lea    -0x22c(%ebp),%eax
 13a:	50                   	push   %eax
 13b:	56                   	push   %esi
 13c:	e8 19 04 00 00       	call   55a <fstat>
		fdt = open(argv[3] ,  O_RDONLY);
 141:	58                   	pop    %eax
 142:	5a                   	pop    %edx
 143:	6a 00                	push   $0x0
 145:	ff 73 0c             	pushl  0xc(%ebx)
 148:	e8 f5 03 00 00       	call   542 <open>
		
		if(st.type != T_DIR){
 14d:	83 c4 10             	add    $0x10,%esp
 150:	66 83 bd d4 fd ff ff 	cmpw   $0x1,-0x22c(%ebp)
 157:	01 
	else if (argc > 1 && argv[1][0] == '-' && (argv[1][1] == 'R' || argv[1][1] == 'r' )){
		struct stat st;
		struct stat st2;
		fds = open(argv[2] ,  O_RDONLY);
		fstat(fds, &st);
		fdt = open(argv[3] ,  O_RDONLY);
 158:	89 c3                	mov    %eax,%ebx
		
		if(st.type != T_DIR){
 15a:	0f 85 27 01 00 00    	jne    287 <main+0x287>
			printf(1 , "copy : sumber bukan direktori\n");
			exit();
			}
		if (fds < 0 ) {
 160:	85 f6                	test   %esi,%esi
 162:	0f 88 04 01 00 00    	js     26c <main+0x26c>
				printf(1,"copy : Tidak dapat membuka sumber %s\n",argv[2]);
				exit();
			}
		if (fdt < 0 ) {
 168:	85 c0                	test   %eax,%eax
 16a:	0f 88 86 00 00 00    	js     1f6 <main+0x1f6>
			close(fdt);
			mkdir(argv[3]);
				
			}
		fstat(fdt, &st2);
 170:	50                   	push   %eax
 171:	50                   	push   %eax
 172:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 178:	50                   	push   %eax
 179:	53                   	push   %ebx
 17a:	e8 db 03 00 00       	call   55a <fstat>
		if (st2.type != T_DIR){
 17f:	83 c4 10             	add    $0x10,%esp
 182:	66 83 bd e8 fd ff ff 	cmpw   $0x1,-0x218(%ebp)
 189:	01 
 18a:	0f 85 c9 00 00 00    	jne    259 <main+0x259>
				printf(1 , "copy : tujuan bukan direktori\n");
				exit();
			}
		
		if (st.type == T_DIR && st2.type == T_DIR){
 190:	66 83 bd d4 fd ff ff 	cmpw   $0x1,-0x22c(%ebp)
 197:	01 
 198:	74 49                	je     1e3 <main+0x1e3>
  close(fs);
  close(ft);

exit();
	}
}
 19a:	8d 65 f0             	lea    -0x10(%ebp),%esp
 19d:	31 c0                	xor    %eax,%eax
 19f:	59                   	pop    %ecx
 1a0:	5b                   	pop    %ebx
 1a1:	5e                   	pop    %esi
 1a2:	5f                   	pop    %edi
 1a3:	5d                   	pop    %ebp
 1a4:	8d 61 fc             	lea    -0x4(%ecx),%esp
 1a7:	c3                   	ret    
  	  w = write(ft, buf, r);
  	  if (w != r || w < 0) 
      break;
 	 }
  	if (r < 0 || w < 0)
    	printf(2, "copy: error copying %s to %s\n", argv[1], argv[2]);
 1a8:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
 1ae:	ff 70 08             	pushl  0x8(%eax)
 1b1:	ff 70 04             	pushl  0x4(%eax)
 1b4:	68 a5 09 00 00       	push   $0x9a5
 1b9:	6a 02                	push   $0x2
 1bb:	e8 90 04 00 00       	call   650 <printf>
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	e9 27 ff ff ff       	jmp    ef <main+0xef>
    		printf(2, "copy: Tidak dapat membuka sumber %s\n", argv[1]);
    		exit();
  		}

		  if ((ft = open(argv[2], O_CREATE|O_WRONLY)) < 0) {
    		printf(2, "copy: Tisak dapat membuka tujuan %s\n", argv[2]);
 1c8:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
 1ce:	52                   	push   %edx
 1cf:	ff 70 08             	pushl  0x8(%eax)
 1d2:	68 54 0a 00 00       	push   $0xa54
 1d7:	6a 02                	push   $0x2
 1d9:	e8 72 04 00 00       	call   650 <printf>
    		exit();
 1de:	e8 1f 03 00 00       	call   502 <exit>
				printf(1 , "copy : tujuan bukan direktori\n");
				exit();
			}
		
		if (st.type == T_DIR && st2.type == T_DIR){
				printf(1 , "copy : HEHEHE\n");
 1e3:	50                   	push   %eax
 1e4:	50                   	push   %eax
 1e5:	68 8a 09 00 00       	push   $0x98a
 1ea:	6a 01                	push   $0x1
 1ec:	e8 5f 04 00 00       	call   650 <printf>
				exit();
 1f1:	e8 0c 03 00 00       	call   502 <exit>
		if (fds < 0 ) {
				printf(1,"copy : Tidak dapat membuka sumber %s\n",argv[2]);
				exit();
			}
		if (fdt < 0 ) {
			close(fdt);
 1f6:	83 ec 0c             	sub    $0xc,%esp
 1f9:	50                   	push   %eax
 1fa:	e8 2b 03 00 00       	call   52a <close>
			mkdir(argv[3]);
 1ff:	58                   	pop    %eax
 200:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
 206:	ff 70 0c             	pushl  0xc(%eax)
 209:	e8 5c 03 00 00       	call   56a <mkdir>
 20e:	83 c4 10             	add    $0x10,%esp
 211:	e9 5a ff ff ff       	jmp    170 <main+0x170>
	char buf[512];
	int r ,fs , ft , w = 0; 
	int fds , fdt;
	
	if(argc < 3){
	printf(2 , "copy : Minimal 2 argumen\n");
 216:	51                   	push   %ecx
 217:	51                   	push   %ecx
 218:	68 70 09 00 00       	push   $0x970
 21d:	6a 02                	push   $0x2
 21f:	e8 2c 04 00 00       	call   650 <printf>
	exit();
 224:	e8 d9 02 00 00       	call   502 <exit>


			}
	}
	else if (argc > 1 && argv[1][0] == '*'){
		if ( link(argv[2], argv[3]) < 0){
 229:	50                   	push   %eax
 22a:	50                   	push   %eax
 22b:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
 231:	ff 70 0c             	pushl  0xc(%eax)
 234:	ff 70 08             	pushl  0x8(%eax)
 237:	e8 26 03 00 00       	call   562 <link>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	85 c0                	test   %eax,%eax
 241:	79 11                	jns    254 <main+0x254>
		printf(1 , "copy : LOL\n");
 243:	57                   	push   %edi
 244:	57                   	push   %edi
 245:	68 99 09 00 00       	push   $0x999
 24a:	6a 01                	push   $0x1
 24c:	e8 ff 03 00 00       	call   650 <printf>
 251:	83 c4 10             	add    $0x10,%esp
		}
				exit();
 254:	e8 a9 02 00 00       	call   502 <exit>
			mkdir(argv[3]);
				
			}
		fstat(fdt, &st2);
		if (st2.type != T_DIR){
				printf(1 , "copy : tujuan bukan direktori\n");
 259:	50                   	push   %eax
 25a:	50                   	push   %eax
 25b:	68 0c 0a 00 00       	push   $0xa0c
 260:	6a 01                	push   $0x1
 262:	e8 e9 03 00 00       	call   650 <printf>
				exit();
 267:	e8 96 02 00 00       	call   502 <exit>
		if(st.type != T_DIR){
			printf(1 , "copy : sumber bukan direktori\n");
			exit();
			}
		if (fds < 0 ) {
				printf(1,"copy : Tidak dapat membuka sumber %s\n",argv[2]);
 26c:	50                   	push   %eax
 26d:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
 273:	ff 70 08             	pushl  0x8(%eax)
 276:	68 e4 09 00 00       	push   $0x9e4
 27b:	6a 01                	push   $0x1
 27d:	e8 ce 03 00 00       	call   650 <printf>
				exit();
 282:	e8 7b 02 00 00       	call   502 <exit>
		fds = open(argv[2] ,  O_RDONLY);
		fstat(fds, &st);
		fdt = open(argv[3] ,  O_RDONLY);
		
		if(st.type != T_DIR){
			printf(1 , "copy : sumber bukan direktori\n");
 287:	52                   	push   %edx
 288:	52                   	push   %edx
 289:	68 c4 09 00 00       	push   $0x9c4
 28e:	6a 01                	push   $0x1
 290:	e8 bb 03 00 00       	call   650 <printf>
			exit();
 295:	e8 68 02 00 00       	call   502 <exit>

	}else if (argc > 1) {


  		if ((fs = open(argv[1], O_RDONLY)) < 0) {
    		printf(2, "copy: Tidak dapat membuka sumber %s\n", argv[1]);
 29a:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
 2a0:	53                   	push   %ebx
 2a1:	ff 70 04             	pushl  0x4(%eax)
 2a4:	68 2c 0a 00 00       	push   $0xa2c
 2a9:	6a 02                	push   $0x2
 2ab:	e8 a0 03 00 00       	call   650 <printf>
    		exit();
 2b0:	e8 4d 02 00 00       	call   502 <exit>
 2b5:	66 90                	xchg   %ax,%ax
 2b7:	66 90                	xchg   %ax,%ax
 2b9:	66 90                	xchg   %ax,%ax
 2bb:	66 90                	xchg   %ax,%ax
 2bd:	66 90                	xchg   %ax,%ax
 2bf:	90                   	nop

000002c0 <strcpy>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ca:	89 c2                	mov    %eax,%edx
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d0:	83 c1 01             	add    $0x1,%ecx
 2d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2d7:	83 c2 01             	add    $0x1,%edx
 2da:	84 db                	test   %bl,%bl
 2dc:	88 5a ff             	mov    %bl,-0x1(%edx)
 2df:	75 ef                	jne    2d0 <strcpy+0x10>
 2e1:	5b                   	pop    %ebx
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    
 2e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002f0 <strcmp>:
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	8b 55 08             	mov    0x8(%ebp),%edx
 2f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2fb:	0f b6 02             	movzbl (%edx),%eax
 2fe:	0f b6 19             	movzbl (%ecx),%ebx
 301:	84 c0                	test   %al,%al
 303:	75 1e                	jne    323 <strcmp+0x33>
 305:	eb 29                	jmp    330 <strcmp+0x40>
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 310:	83 c2 01             	add    $0x1,%edx
 313:	0f b6 02             	movzbl (%edx),%eax
 316:	8d 71 01             	lea    0x1(%ecx),%esi
 319:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 31d:	84 c0                	test   %al,%al
 31f:	74 0f                	je     330 <strcmp+0x40>
 321:	89 f1                	mov    %esi,%ecx
 323:	38 d8                	cmp    %bl,%al
 325:	74 e9                	je     310 <strcmp+0x20>
 327:	29 d8                	sub    %ebx,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi
 330:	31 c0                	xor    %eax,%eax
 332:	29 d8                	sub    %ebx,%eax
 334:	5b                   	pop    %ebx
 335:	5e                   	pop    %esi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <strlen>:
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 4d 08             	mov    0x8(%ebp),%ecx
 346:	80 39 00             	cmpb   $0x0,(%ecx)
 349:	74 12                	je     35d <strlen+0x1d>
 34b:	31 d2                	xor    %edx,%edx
 34d:	8d 76 00             	lea    0x0(%esi),%esi
 350:	83 c2 01             	add    $0x1,%edx
 353:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 357:	89 d0                	mov    %edx,%eax
 359:	75 f5                	jne    350 <strlen+0x10>
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	31 c0                	xor    %eax,%eax
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	eb 0d                	jmp    370 <memset>
 363:	90                   	nop
 364:	90                   	nop
 365:	90                   	nop
 366:	90                   	nop
 367:	90                   	nop
 368:	90                   	nop
 369:	90                   	nop
 36a:	90                   	nop
 36b:	90                   	nop
 36c:	90                   	nop
 36d:	90                   	nop
 36e:	90                   	nop
 36f:	90                   	nop

00000370 <memset>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	8b 4d 10             	mov    0x10(%ebp),%ecx
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	89 d7                	mov    %edx,%edi
 37f:	fc                   	cld    
 380:	f3 aa                	rep stos %al,%es:(%edi)
 382:	89 d0                	mov    %edx,%eax
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <strchr>:
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 39a:	0f b6 10             	movzbl (%eax),%edx
 39d:	84 d2                	test   %dl,%dl
 39f:	74 1d                	je     3be <strchr+0x2e>
 3a1:	38 d3                	cmp    %dl,%bl
 3a3:	89 d9                	mov    %ebx,%ecx
 3a5:	75 0d                	jne    3b4 <strchr+0x24>
 3a7:	eb 17                	jmp    3c0 <strchr+0x30>
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3b0:	38 ca                	cmp    %cl,%dl
 3b2:	74 0c                	je     3c0 <strchr+0x30>
 3b4:	83 c0 01             	add    $0x1,%eax
 3b7:	0f b6 10             	movzbl (%eax),%edx
 3ba:	84 d2                	test   %dl,%dl
 3bc:	75 f2                	jne    3b0 <strchr+0x20>
 3be:	31 c0                	xor    %eax,%eax
 3c0:	5b                   	pop    %ebx
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret    
 3c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <gets>:
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	31 f6                	xor    %esi,%esi
 3d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3db:	83 ec 1c             	sub    $0x1c,%esp
 3de:	eb 29                	jmp    409 <gets+0x39>
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	6a 01                	push   $0x1
 3e5:	57                   	push   %edi
 3e6:	6a 00                	push   $0x0
 3e8:	e8 2d 01 00 00       	call   51a <read>
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7e 1d                	jle    411 <gets+0x41>
 3f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3f8:	8b 55 08             	mov    0x8(%ebp),%edx
 3fb:	89 de                	mov    %ebx,%esi
 3fd:	3c 0a                	cmp    $0xa,%al
 3ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 403:	74 1b                	je     420 <gets+0x50>
 405:	3c 0d                	cmp    $0xd,%al
 407:	74 17                	je     420 <gets+0x50>
 409:	8d 5e 01             	lea    0x1(%esi),%ebx
 40c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 40f:	7c cf                	jl     3e0 <gets+0x10>
 411:	8b 45 08             	mov    0x8(%ebp),%eax
 414:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 418:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41b:	5b                   	pop    %ebx
 41c:	5e                   	pop    %esi
 41d:	5f                   	pop    %edi
 41e:	5d                   	pop    %ebp
 41f:	c3                   	ret    
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	89 de                	mov    %ebx,%esi
 425:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 429:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42c:	5b                   	pop    %ebx
 42d:	5e                   	pop    %esi
 42e:	5f                   	pop    %edi
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    
 431:	eb 0d                	jmp    440 <stat>
 433:	90                   	nop
 434:	90                   	nop
 435:	90                   	nop
 436:	90                   	nop
 437:	90                   	nop
 438:	90                   	nop
 439:	90                   	nop
 43a:	90                   	nop
 43b:	90                   	nop
 43c:	90                   	nop
 43d:	90                   	nop
 43e:	90                   	nop
 43f:	90                   	nop

00000440 <stat>:
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	56                   	push   %esi
 444:	53                   	push   %ebx
 445:	83 ec 08             	sub    $0x8,%esp
 448:	6a 00                	push   $0x0
 44a:	ff 75 08             	pushl  0x8(%ebp)
 44d:	e8 f0 00 00 00       	call   542 <open>
 452:	83 c4 10             	add    $0x10,%esp
 455:	85 c0                	test   %eax,%eax
 457:	78 27                	js     480 <stat+0x40>
 459:	83 ec 08             	sub    $0x8,%esp
 45c:	ff 75 0c             	pushl  0xc(%ebp)
 45f:	89 c3                	mov    %eax,%ebx
 461:	50                   	push   %eax
 462:	e8 f3 00 00 00       	call   55a <fstat>
 467:	89 c6                	mov    %eax,%esi
 469:	89 1c 24             	mov    %ebx,(%esp)
 46c:	e8 b9 00 00 00       	call   52a <close>
 471:	83 c4 10             	add    $0x10,%esp
 474:	89 f0                	mov    %esi,%eax
 476:	8d 65 f8             	lea    -0x8(%ebp),%esp
 479:	5b                   	pop    %ebx
 47a:	5e                   	pop    %esi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 485:	eb ef                	jmp    476 <stat+0x36>
 487:	89 f6                	mov    %esi,%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <atoi>:
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
 494:	8b 4d 08             	mov    0x8(%ebp),%ecx
 497:	0f be 11             	movsbl (%ecx),%edx
 49a:	8d 42 d0             	lea    -0x30(%edx),%eax
 49d:	3c 09                	cmp    $0x9,%al
 49f:	b8 00 00 00 00       	mov    $0x0,%eax
 4a4:	77 1f                	ja     4c5 <atoi+0x35>
 4a6:	8d 76 00             	lea    0x0(%esi),%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 4b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4b3:	83 c1 01             	add    $0x1,%ecx
 4b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 4ba:	0f be 11             	movsbl (%ecx),%edx
 4bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
 4c5:	5b                   	pop    %ebx
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    
 4c8:	90                   	nop
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004d0 <memmove>:
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
 4d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4d8:	8b 45 08             	mov    0x8(%ebp),%eax
 4db:	8b 75 0c             	mov    0xc(%ebp),%esi
 4de:	85 db                	test   %ebx,%ebx
 4e0:	7e 14                	jle    4f6 <memmove+0x26>
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4ef:	83 c2 01             	add    $0x1,%edx
 4f2:	39 da                	cmp    %ebx,%edx
 4f4:	75 f2                	jne    4e8 <memmove+0x18>
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi
 4f8:	5d                   	pop    %ebp
 4f9:	c3                   	ret    

000004fa <fork>:
 4fa:	b8 01 00 00 00       	mov    $0x1,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <exit>:
 502:	b8 02 00 00 00       	mov    $0x2,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <wait>:
 50a:	b8 03 00 00 00       	mov    $0x3,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <pipe>:
 512:	b8 04 00 00 00       	mov    $0x4,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <read>:
 51a:	b8 05 00 00 00       	mov    $0x5,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <write>:
 522:	b8 10 00 00 00       	mov    $0x10,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <close>:
 52a:	b8 15 00 00 00       	mov    $0x15,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <kill>:
 532:	b8 06 00 00 00       	mov    $0x6,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <exec>:
 53a:	b8 07 00 00 00       	mov    $0x7,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <open>:
 542:	b8 0f 00 00 00       	mov    $0xf,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <mknod>:
 54a:	b8 11 00 00 00       	mov    $0x11,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <unlink>:
 552:	b8 12 00 00 00       	mov    $0x12,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <fstat>:
 55a:	b8 08 00 00 00       	mov    $0x8,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <link>:
 562:	b8 13 00 00 00       	mov    $0x13,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mkdir>:
 56a:	b8 14 00 00 00       	mov    $0x14,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <chdir>:
 572:	b8 09 00 00 00       	mov    $0x9,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <dup>:
 57a:	b8 0a 00 00 00       	mov    $0xa,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <getpid>:
 582:	b8 0b 00 00 00       	mov    $0xb,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <sbrk>:
 58a:	b8 0c 00 00 00       	mov    $0xc,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sleep>:
 592:	b8 0d 00 00 00       	mov    $0xd,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <uptime>:
 59a:	b8 0e 00 00 00       	mov    $0xe,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <mkfile>:
 5a2:	b8 16 00 00 00       	mov    $0x16,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    
 5aa:	66 90                	xchg   %ax,%ax
 5ac:	66 90                	xchg   %ax,%ax
 5ae:	66 90                	xchg   %ax,%ax

000005b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	89 c6                	mov    %eax,%esi
 5b8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5be:	85 db                	test   %ebx,%ebx
 5c0:	74 7e                	je     640 <printint+0x90>
 5c2:	89 d0                	mov    %edx,%eax
 5c4:	c1 e8 1f             	shr    $0x1f,%eax
 5c7:	84 c0                	test   %al,%al
 5c9:	74 75                	je     640 <printint+0x90>
    neg = 1;
    x = -xx;
 5cb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5cd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 5d4:	f7 d8                	neg    %eax
 5d6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5d9:	31 ff                	xor    %edi,%edi
 5db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5de:	89 ce                	mov    %ecx,%esi
 5e0:	eb 08                	jmp    5ea <printint+0x3a>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5e8:	89 cf                	mov    %ecx,%edi
 5ea:	31 d2                	xor    %edx,%edx
 5ec:	8d 4f 01             	lea    0x1(%edi),%ecx
 5ef:	f7 f6                	div    %esi
 5f1:	0f b6 92 84 0a 00 00 	movzbl 0xa84(%edx),%edx
  }while((x /= base) != 0);
 5f8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 5fa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 5fd:	75 e9                	jne    5e8 <printint+0x38>
  if(neg)
 5ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 602:	8b 75 c0             	mov    -0x40(%ebp),%esi
 605:	85 c0                	test   %eax,%eax
 607:	74 08                	je     611 <printint+0x61>
    buf[i++] = '-';
 609:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 60e:	8d 4f 02             	lea    0x2(%edi),%ecx
 611:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 615:	8d 76 00             	lea    0x0(%esi),%esi
 618:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	83 ef 01             	sub    $0x1,%edi
 621:	6a 01                	push   $0x1
 623:	53                   	push   %ebx
 624:	56                   	push   %esi
 625:	88 45 d7             	mov    %al,-0x29(%ebp)
 628:	e8 f5 fe ff ff       	call   522 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 62d:	83 c4 10             	add    $0x10,%esp
 630:	39 df                	cmp    %ebx,%edi
 632:	75 e4                	jne    618 <printint+0x68>
    putc(fd, buf[i]);
}
 634:	8d 65 f4             	lea    -0xc(%ebp),%esp
 637:	5b                   	pop    %ebx
 638:	5e                   	pop    %esi
 639:	5f                   	pop    %edi
 63a:	5d                   	pop    %ebp
 63b:	c3                   	ret    
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 640:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 642:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 649:	eb 8b                	jmp    5d6 <printint+0x26>
 64b:	90                   	nop
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000650 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 656:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 659:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 65c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 65f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 662:	89 45 d0             	mov    %eax,-0x30(%ebp)
 665:	0f b6 1e             	movzbl (%esi),%ebx
 668:	83 c6 01             	add    $0x1,%esi
 66b:	84 db                	test   %bl,%bl
 66d:	0f 84 b0 00 00 00    	je     723 <printf+0xd3>
 673:	31 d2                	xor    %edx,%edx
 675:	eb 39                	jmp    6b0 <printf+0x60>
 677:	89 f6                	mov    %esi,%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 680:	83 f8 25             	cmp    $0x25,%eax
 683:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 686:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 68b:	74 18                	je     6a5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 68d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 696:	6a 01                	push   $0x1
 698:	50                   	push   %eax
 699:	57                   	push   %edi
 69a:	e8 83 fe ff ff       	call   522 <write>
 69f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 6a2:	83 c4 10             	add    $0x10,%esp
 6a5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6ac:	84 db                	test   %bl,%bl
 6ae:	74 73                	je     723 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 6b0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 6b2:	0f be cb             	movsbl %bl,%ecx
 6b5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6b8:	74 c6                	je     680 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6ba:	83 fa 25             	cmp    $0x25,%edx
 6bd:	75 e6                	jne    6a5 <printf+0x55>
      if(c == 'd'){
 6bf:	83 f8 64             	cmp    $0x64,%eax
 6c2:	0f 84 f8 00 00 00    	je     7c0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6c8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ce:	83 f9 70             	cmp    $0x70,%ecx
 6d1:	74 5d                	je     730 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6d3:	83 f8 73             	cmp    $0x73,%eax
 6d6:	0f 84 84 00 00 00    	je     760 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6dc:	83 f8 63             	cmp    $0x63,%eax
 6df:	0f 84 ea 00 00 00    	je     7cf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6e5:	83 f8 25             	cmp    $0x25,%eax
 6e8:	0f 84 c2 00 00 00    	je     7b0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6f1:	83 ec 04             	sub    $0x4,%esp
 6f4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6f8:	6a 01                	push   $0x1
 6fa:	50                   	push   %eax
 6fb:	57                   	push   %edi
 6fc:	e8 21 fe ff ff       	call   522 <write>
 701:	83 c4 0c             	add    $0xc,%esp
 704:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 707:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 70a:	6a 01                	push   $0x1
 70c:	50                   	push   %eax
 70d:	57                   	push   %edi
 70e:	83 c6 01             	add    $0x1,%esi
 711:	e8 0c fe ff ff       	call   522 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 716:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 71a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 71d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 71f:	84 db                	test   %bl,%bl
 721:	75 8d                	jne    6b0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 723:	8d 65 f4             	lea    -0xc(%ebp),%esp
 726:	5b                   	pop    %ebx
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
 72b:	90                   	nop
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 10 00 00 00       	mov    $0x10,%ecx
 738:	6a 00                	push   $0x0
 73a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 73d:	89 f8                	mov    %edi,%eax
 73f:	8b 13                	mov    (%ebx),%edx
 741:	e8 6a fe ff ff       	call   5b0 <printint>
        ap++;
 746:	89 d8                	mov    %ebx,%eax
 748:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 74b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 74d:	83 c0 04             	add    $0x4,%eax
 750:	89 45 d0             	mov    %eax,-0x30(%ebp)
 753:	e9 4d ff ff ff       	jmp    6a5 <printf+0x55>
 758:	90                   	nop
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 760:	8b 45 d0             	mov    -0x30(%ebp),%eax
 763:	8b 18                	mov    (%eax),%ebx
        ap++;
 765:	83 c0 04             	add    $0x4,%eax
 768:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 76b:	b8 7c 0a 00 00       	mov    $0xa7c,%eax
 770:	85 db                	test   %ebx,%ebx
 772:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 775:	0f b6 03             	movzbl (%ebx),%eax
 778:	84 c0                	test   %al,%al
 77a:	74 23                	je     79f <printf+0x14f>
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 780:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 783:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 786:	83 ec 04             	sub    $0x4,%esp
 789:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 78b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 78e:	50                   	push   %eax
 78f:	57                   	push   %edi
 790:	e8 8d fd ff ff       	call   522 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 795:	0f b6 03             	movzbl (%ebx),%eax
 798:	83 c4 10             	add    $0x10,%esp
 79b:	84 c0                	test   %al,%al
 79d:	75 e1                	jne    780 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 79f:	31 d2                	xor    %edx,%edx
 7a1:	e9 ff fe ff ff       	jmp    6a5 <printf+0x55>
 7a6:	8d 76 00             	lea    0x0(%esi),%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
 7b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7b9:	6a 01                	push   $0x1
 7bb:	e9 4c ff ff ff       	jmp    70c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c8:	6a 01                	push   $0x1
 7ca:	e9 6b ff ff ff       	jmp    73a <printf+0xea>
 7cf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7d2:	83 ec 04             	sub    $0x4,%esp
 7d5:	8b 03                	mov    (%ebx),%eax
 7d7:	6a 01                	push   $0x1
 7d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 7dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7df:	50                   	push   %eax
 7e0:	57                   	push   %edi
 7e1:	e8 3c fd ff ff       	call   522 <write>
 7e6:	e9 5b ff ff ff       	jmp    746 <printf+0xf6>
 7eb:	66 90                	xchg   %ax,%ax
 7ed:	66 90                	xchg   %ax,%ax
 7ef:	90                   	nop

000007f0 <free>:
 7f0:	55                   	push   %ebp
 7f1:	a1 40 0d 00 00       	mov    0xd40,%eax
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7fe:	8b 10                	mov    (%eax),%edx
 800:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 803:	39 c8                	cmp    %ecx,%eax
 805:	73 19                	jae    820 <free+0x30>
 807:	89 f6                	mov    %esi,%esi
 809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 810:	39 d1                	cmp    %edx,%ecx
 812:	72 1c                	jb     830 <free+0x40>
 814:	39 d0                	cmp    %edx,%eax
 816:	73 18                	jae    830 <free+0x40>
 818:	89 d0                	mov    %edx,%eax
 81a:	39 c8                	cmp    %ecx,%eax
 81c:	8b 10                	mov    (%eax),%edx
 81e:	72 f0                	jb     810 <free+0x20>
 820:	39 d0                	cmp    %edx,%eax
 822:	72 f4                	jb     818 <free+0x28>
 824:	39 d1                	cmp    %edx,%ecx
 826:	73 f0                	jae    818 <free+0x28>
 828:	90                   	nop
 829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 830:	8b 73 fc             	mov    -0x4(%ebx),%esi
 833:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 836:	39 d7                	cmp    %edx,%edi
 838:	74 19                	je     853 <free+0x63>
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 83d:	8b 50 04             	mov    0x4(%eax),%edx
 840:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 843:	39 f1                	cmp    %esi,%ecx
 845:	74 23                	je     86a <free+0x7a>
 847:	89 08                	mov    %ecx,(%eax)
 849:	a3 40 0d 00 00       	mov    %eax,0xd40
 84e:	5b                   	pop    %ebx
 84f:	5e                   	pop    %esi
 850:	5f                   	pop    %edi
 851:	5d                   	pop    %ebp
 852:	c3                   	ret    
 853:	03 72 04             	add    0x4(%edx),%esi
 856:	89 73 fc             	mov    %esi,-0x4(%ebx)
 859:	8b 10                	mov    (%eax),%edx
 85b:	8b 12                	mov    (%edx),%edx
 85d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 860:	8b 50 04             	mov    0x4(%eax),%edx
 863:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 866:	39 f1                	cmp    %esi,%ecx
 868:	75 dd                	jne    847 <free+0x57>
 86a:	03 53 fc             	add    -0x4(%ebx),%edx
 86d:	a3 40 0d 00 00       	mov    %eax,0xd40
 872:	89 50 04             	mov    %edx,0x4(%eax)
 875:	8b 53 f8             	mov    -0x8(%ebx),%edx
 878:	89 10                	mov    %edx,(%eax)
 87a:	5b                   	pop    %ebx
 87b:	5e                   	pop    %esi
 87c:	5f                   	pop    %edi
 87d:	5d                   	pop    %ebp
 87e:	c3                   	ret    
 87f:	90                   	nop

00000880 <malloc>:
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 0c             	sub    $0xc,%esp
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	8b 15 40 0d 00 00    	mov    0xd40,%edx
 892:	8d 78 07             	lea    0x7(%eax),%edi
 895:	c1 ef 03             	shr    $0x3,%edi
 898:	83 c7 01             	add    $0x1,%edi
 89b:	85 d2                	test   %edx,%edx
 89d:	0f 84 a3 00 00 00    	je     946 <malloc+0xc6>
 8a3:	8b 02                	mov    (%edx),%eax
 8a5:	8b 48 04             	mov    0x4(%eax),%ecx
 8a8:	39 cf                	cmp    %ecx,%edi
 8aa:	76 74                	jbe    920 <malloc+0xa0>
 8ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8b2:	be 00 10 00 00       	mov    $0x1000,%esi
 8b7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 8be:	0f 43 f7             	cmovae %edi,%esi
 8c1:	ba 00 80 00 00       	mov    $0x8000,%edx
 8c6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 8cc:	0f 46 da             	cmovbe %edx,%ebx
 8cf:	eb 10                	jmp    8e1 <malloc+0x61>
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8d8:	8b 02                	mov    (%edx),%eax
 8da:	8b 48 04             	mov    0x4(%eax),%ecx
 8dd:	39 cf                	cmp    %ecx,%edi
 8df:	76 3f                	jbe    920 <malloc+0xa0>
 8e1:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 8e7:	89 c2                	mov    %eax,%edx
 8e9:	75 ed                	jne    8d8 <malloc+0x58>
 8eb:	83 ec 0c             	sub    $0xc,%esp
 8ee:	53                   	push   %ebx
 8ef:	e8 96 fc ff ff       	call   58a <sbrk>
 8f4:	83 c4 10             	add    $0x10,%esp
 8f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8fa:	74 1c                	je     918 <malloc+0x98>
 8fc:	89 70 04             	mov    %esi,0x4(%eax)
 8ff:	83 ec 0c             	sub    $0xc,%esp
 902:	83 c0 08             	add    $0x8,%eax
 905:	50                   	push   %eax
 906:	e8 e5 fe ff ff       	call   7f0 <free>
 90b:	8b 15 40 0d 00 00    	mov    0xd40,%edx
 911:	83 c4 10             	add    $0x10,%esp
 914:	85 d2                	test   %edx,%edx
 916:	75 c0                	jne    8d8 <malloc+0x58>
 918:	31 c0                	xor    %eax,%eax
 91a:	eb 1c                	jmp    938 <malloc+0xb8>
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 920:	39 cf                	cmp    %ecx,%edi
 922:	74 1c                	je     940 <malloc+0xc0>
 924:	29 f9                	sub    %edi,%ecx
 926:	89 48 04             	mov    %ecx,0x4(%eax)
 929:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 92c:	89 78 04             	mov    %edi,0x4(%eax)
 92f:	89 15 40 0d 00 00    	mov    %edx,0xd40
 935:	83 c0 08             	add    $0x8,%eax
 938:	8d 65 f4             	lea    -0xc(%ebp),%esp
 93b:	5b                   	pop    %ebx
 93c:	5e                   	pop    %esi
 93d:	5f                   	pop    %edi
 93e:	5d                   	pop    %ebp
 93f:	c3                   	ret    
 940:	8b 08                	mov    (%eax),%ecx
 942:	89 0a                	mov    %ecx,(%edx)
 944:	eb e9                	jmp    92f <malloc+0xaf>
 946:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 94d:	0d 00 00 
 950:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 957:	0d 00 00 
 95a:	b8 44 0d 00 00       	mov    $0xd44,%eax
 95f:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 966:	00 00 00 
 969:	e9 3e ff ff ff       	jmp    8ac <malloc+0x2c>
