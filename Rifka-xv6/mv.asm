
_mv:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void ls(char *path);
char* fmtname(char *path);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
	if (argc !=3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)

void ls(char *path);
char* fmtname(char *path);

int main(int argc, char *argv[])
{
  1a:	8b 41 04             	mov    0x4(%ecx),%eax
  1d:	89 85 44 fe ff ff    	mov    %eax,-0x1bc(%ebp)
	if (argc !=3)
  23:	0f 85 8f 01 00 00    	jne    1b8 <main+0x1b8>
	if(argc < 3){
	printf(2 , "copy : Minimal 2 argumen\n");
	exit();
	}
	else if(argc > 1){
		int fd_src = open(argv[1], O_RDONLY);
  29:	8b 85 44 fe ff ff    	mov    -0x1bc(%ebp),%eax
  2f:	51                   	push   %ecx
  30:	51                   	push   %ecx
  31:	6a 00                	push   $0x0
  33:	ff 70 04             	pushl  0x4(%eax)
  36:	e8 07 07 00 00       	call   742 <open>
		if (fd_src == -1)
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	83 f8 ff             	cmp    $0xffffffff,%eax
	if(argc < 3){
	printf(2 , "copy : Minimal 2 argumen\n");
	exit();
	}
	else if(argc > 1){
		int fd_src = open(argv[1], O_RDONLY);
  41:	89 c6                	mov    %eax,%esi
		if (fd_src == -1)
  43:	0f 84 82 01 00 00    	je     1cb <main+0x1cb>
			printf(1, "Gagal membuka file!\n");
			exit();
		}
		
		struct stat st;
		fstat(fd_src, &st);
  49:	50                   	push   %eax
  4a:	50                   	push   %eax
  4b:	8d 85 54 fe ff ff    	lea    -0x1ac(%ebp),%eax
  51:	50                   	push   %eax
  52:	56                   	push   %esi
  53:	e8 02 07 00 00       	call   75a <fstat>
		if (st.type == T_DIR)
  58:	83 c4 10             	add    $0x10,%esp
  5b:	66 83 bd 54 fe ff ff 	cmpw   $0x1,-0x1ac(%ebp)
  62:	01 
  63:	0f 84 75 01 00 00    	je     1de <main+0x1de>
			printf(1, "File source dalam bentuk direktori, file yang berada dalam direktori tersebut adalah:\n");
			ls(argv[1]);
			exit();
		}

		char com[128] = {};
  69:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  6f:	31 c0                	xor    %eax,%eax
  71:	b9 20 00 00 00       	mov    $0x20,%ecx
		strcpy(com, argv[2]);
  76:	8d 9d 68 fe ff ff    	lea    -0x198(%ebp),%ebx
			printf(1, "File source dalam bentuk direktori, file yang berada dalam direktori tersebut adalah:\n");
			ls(argv[1]);
			exit();
		}

		char com[128] = {};
  7c:	f3 ab                	rep stos %eax,%es:(%edi)
		strcpy(com, argv[2]);
  7e:	8b bd 44 fe ff ff    	mov    -0x1bc(%ebp),%edi
  84:	50                   	push   %eax
  85:	50                   	push   %eax
  86:	ff 77 08             	pushl  0x8(%edi)
  89:	53                   	push   %ebx
  8a:	e8 31 04 00 00       	call   4c0 <strcpy>
		int len1 = strlen(argv[1]);
  8f:	58                   	pop    %eax
  90:	ff 77 04             	pushl  0x4(%edi)
  93:	89 bd 44 fe ff ff    	mov    %edi,-0x1bc(%ebp)
  99:	e8 a2 04 00 00       	call   540 <strlen>
  9e:	89 c7                	mov    %eax,%edi
		int len2 = strlen(argv[2]);
  a0:	58                   	pop    %eax
  a1:	8b 85 44 fe ff ff    	mov    -0x1bc(%ebp),%eax
  a7:	ff 70 08             	pushl  0x8(%eax)
  aa:	e8 91 04 00 00       	call   540 <strlen>
		if (argv[2][len2-1] == '/')
  af:	8b 95 44 fe ff ff    	mov    -0x1bc(%ebp),%edx
  b5:	83 c4 10             	add    $0x10,%esp
  b8:	8b 52 08             	mov    0x8(%edx),%edx
  bb:	80 7c 02 ff 2f       	cmpb   $0x2f,-0x1(%edx,%eax,1)
  c0:	0f 84 97 00 00 00    	je     15d <main+0x15d>
					break;
			i++;
			strcpy(&com[len2], &argv[1][i]);
		}
		
		int fd_dest = open(com, O_WRONLY|O_CREATE);
  c6:	57                   	push   %edi
  c7:	57                   	push   %edi
  c8:	68 01 02 00 00       	push   $0x201
  cd:	53                   	push   %ebx
  ce:	e8 6f 06 00 00       	call   742 <open>
		if (fd_dest == -1)
  d3:	83 c4 10             	add    $0x10,%esp
					break;
			i++;
			strcpy(&com[len2], &argv[1][i]);
		}
		
		int fd_dest = open(com, O_WRONLY|O_CREATE);
  d6:	89 85 40 fe ff ff    	mov    %eax,-0x1c0(%ebp)
		if (fd_dest == -1)
  dc:	83 c0 01             	add    $0x1,%eax
  df:	0f 84 1b 01 00 00    	je     200 <main+0x200>
		{
			printf(1, "Gagal membuat file tujuan!\n");
			exit();
		}
		
		char buf[BUF_SIZE] = {};
  e5:	8d 9d e8 fe ff ff    	lea    -0x118(%ebp),%ebx
  eb:	b9 40 00 00 00       	mov    $0x40,%ecx
  f0:	31 c0                	xor    %eax,%eax
  f2:	89 df                	mov    %ebx,%edi
  f4:	f3 ab                	rep stos %eax,%es:(%edi)
  f6:	8b bd 40 fe ff ff    	mov    -0x1c0(%ebp),%edi
		int len = 0;
		while((len = read(fd_src, buf, BUF_SIZE)) > 0)
  fc:	eb 10                	jmp    10e <main+0x10e>
  fe:	66 90                	xchg   %ax,%ax
			write(fd_dest, buf, len);
 100:	83 ec 04             	sub    $0x4,%esp
 103:	50                   	push   %eax
 104:	53                   	push   %ebx
 105:	57                   	push   %edi
 106:	e8 17 06 00 00       	call   722 <write>
 10b:	83 c4 10             	add    $0x10,%esp
			exit();
		}
		
		char buf[BUF_SIZE] = {};
		int len = 0;
		while((len = read(fd_src, buf, BUF_SIZE)) > 0)
 10e:	83 ec 04             	sub    $0x4,%esp
 111:	68 00 01 00 00       	push   $0x100
 116:	53                   	push   %ebx
 117:	56                   	push   %esi
 118:	e8 fd 05 00 00       	call   71a <read>
 11d:	83 c4 10             	add    $0x10,%esp
 120:	85 c0                	test   %eax,%eax
 122:	7f dc                	jg     100 <main+0x100>
			write(fd_dest, buf, len);
		
		close(fd_src);
 124:	83 ec 0c             	sub    $0xc,%esp
 127:	56                   	push   %esi
 128:	e8 fd 05 00 00       	call   72a <close>
		close(fd_dest);
 12d:	5a                   	pop    %edx
 12e:	ff b5 40 fe ff ff    	pushl  -0x1c0(%ebp)
 134:	e8 f1 05 00 00       	call   72a <close>
		
		if(unlink(argv[1]) < 0)
 139:	8b 85 44 fe ff ff    	mov    -0x1bc(%ebp),%eax
 13f:	59                   	pop    %ecx
 140:	ff 70 04             	pushl  0x4(%eax)
 143:	e8 0a 06 00 00       	call   752 <unlink>
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	78 56                	js     1a5 <main+0x1a5>

	}*/
	
		exit();
	}
}
 14f:	8d 65 f0             	lea    -0x10(%ebp),%esp
 152:	31 c0                	xor    %eax,%eax
 154:	59                   	pop    %ecx
 155:	5b                   	pop    %ebx
 156:	5e                   	pop    %esi
 157:	5f                   	pop    %edi
 158:	5d                   	pop    %ebp
 159:	8d 61 fc             	lea    -0x4(%ecx),%esp
 15c:	c3                   	ret    
		int len2 = strlen(argv[2]);
		if (argv[2][len2-1] == '/')
		{
			int i = len1 - 1;
			for (; i >= 0; i--)
				if (argv[1][i] == '/')
 15d:	8b 8d 44 fe ff ff    	mov    -0x1bc(%ebp),%ecx
		int len1 = strlen(argv[1]);
		int len2 = strlen(argv[2]);
		if (argv[2][len2-1] == '/')
		{
			int i = len1 - 1;
			for (; i >= 0; i--)
 163:	89 fa                	mov    %edi,%edx
 165:	83 ea 01             	sub    $0x1,%edx
				if (argv[1][i] == '/')
 168:	8b 49 04             	mov    0x4(%ecx),%ecx
		int len1 = strlen(argv[1]);
		int len2 = strlen(argv[2]);
		if (argv[2][len2-1] == '/')
		{
			int i = len1 - 1;
			for (; i >= 0; i--)
 16b:	78 21                	js     18e <main+0x18e>
				if (argv[1][i] == '/')
 16d:	80 7c 39 ff 2f       	cmpb   $0x2f,-0x1(%ecx,%edi,1)
 172:	75 12                	jne    186 <main+0x186>
 174:	eb 18                	jmp    18e <main+0x18e>
 176:	8d 76 00             	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 180:	80 3c 11 2f          	cmpb   $0x2f,(%ecx,%edx,1)
 184:	74 08                	je     18e <main+0x18e>
		int len1 = strlen(argv[1]);
		int len2 = strlen(argv[2]);
		if (argv[2][len2-1] == '/')
		{
			int i = len1 - 1;
			for (; i >= 0; i--)
 186:	83 ea 01             	sub    $0x1,%edx
 189:	83 fa ff             	cmp    $0xffffffff,%edx
 18c:	75 f2                	jne    180 <main+0x180>
				if (argv[1][i] == '/')
					break;
			i++;
			strcpy(&com[len2], &argv[1][i]);
 18e:	8d 54 11 01          	lea    0x1(%ecx,%edx,1),%edx
 192:	01 d8                	add    %ebx,%eax
 194:	57                   	push   %edi
 195:	57                   	push   %edi
 196:	52                   	push   %edx
 197:	50                   	push   %eax
 198:	e8 23 03 00 00       	call   4c0 <strcpy>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	e9 21 ff ff ff       	jmp    c6 <main+0xc6>
		
		close(fd_src);
		close(fd_dest);
		
		if(unlink(argv[1]) < 0)
			printf(1, "Gagal menghapus source file\n");
 1a5:	50                   	push   %eax
 1a6:	50                   	push   %eax
 1a7:	68 d0 0b 00 00       	push   $0xbd0
 1ac:	6a 01                	push   $0x1
 1ae:	e8 9d 06 00 00       	call   850 <printf>
 1b3:	83 c4 10             	add    $0x10,%esp
 1b6:	eb 97                	jmp    14f <main+0x14f>

int main(int argc, char *argv[])
{
	if (argc !=3)
	{
		printf(1, "Masukkan input seperti berikut [mv src_file dest_file]\n");
 1b8:	53                   	push   %ebx
 1b9:	53                   	push   %ebx
 1ba:	68 64 0c 00 00       	push   $0xc64
 1bf:	6a 01                	push   $0x1
 1c1:	e8 8a 06 00 00       	call   850 <printf>
		exit();
 1c6:	e8 37 05 00 00       	call   702 <exit>
	}
	else if(argc > 1){
		int fd_src = open(argv[1], O_RDONLY);
		if (fd_src == -1)
		{
			printf(1, "Gagal membuka file!\n");
 1cb:	52                   	push   %edx
 1cc:	52                   	push   %edx
 1cd:	68 9f 0b 00 00       	push   $0xb9f
 1d2:	6a 01                	push   $0x1
 1d4:	e8 77 06 00 00       	call   850 <printf>
			exit();
 1d9:	e8 24 05 00 00       	call   702 <exit>
		
		struct stat st;
		fstat(fd_src, &st);
		if (st.type == T_DIR)
		{
			printf(1, "File source dalam bentuk direktori, file yang berada dalam direktori tersebut adalah:\n");
 1de:	50                   	push   %eax
 1df:	50                   	push   %eax
 1e0:	68 9c 0c 00 00       	push   $0xc9c
 1e5:	6a 01                	push   $0x1
 1e7:	e8 64 06 00 00       	call   850 <printf>
			ls(argv[1]);
 1ec:	58                   	pop    %eax
 1ed:	8b 85 44 fe ff ff    	mov    -0x1bc(%ebp),%eax
 1f3:	ff 70 04             	pushl  0x4(%eax)
 1f6:	e8 c5 00 00 00       	call   2c0 <ls>
			exit();
 1fb:	e8 02 05 00 00       	call   702 <exit>
		}
		
		int fd_dest = open(com, O_WRONLY|O_CREATE);
		if (fd_dest == -1)
		{
			printf(1, "Gagal membuat file tujuan!\n");
 200:	53                   	push   %ebx
 201:	53                   	push   %ebx
 202:	68 b4 0b 00 00       	push   $0xbb4
 207:	6a 01                	push   $0x1
 209:	e8 42 06 00 00       	call   850 <printf>
			exit();
 20e:	e8 ef 04 00 00       	call   702 <exit>
 213:	66 90                	xchg   %ax,%ax
 215:	66 90                	xchg   %ax,%ax
 217:	66 90                	xchg   %ax,%ax
 219:	66 90                	xchg   %ax,%ax
 21b:	66 90                	xchg   %ax,%ax
 21d:	66 90                	xchg   %ax,%ax
 21f:	90                   	nop

00000220 <fmtname>:
	
		exit();
	}
}
char* fmtname(char *path)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	8b 5d 08             	mov    0x8(%ebp),%ebx
	static char buf[DIRSIZ+1];
	char *p;
	
	for(p=path+strlen(path); p >= path && *p != '/'; p--)
 228:	83 ec 0c             	sub    $0xc,%esp
 22b:	53                   	push   %ebx
 22c:	e8 0f 03 00 00       	call   540 <strlen>
 231:	83 c4 10             	add    $0x10,%esp
 234:	01 d8                	add    %ebx,%eax
 236:	73 0f                	jae    247 <fmtname+0x27>
 238:	eb 12                	jmp    24c <fmtname+0x2c>
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 240:	83 e8 01             	sub    $0x1,%eax
 243:	39 c3                	cmp    %eax,%ebx
 245:	77 05                	ja     24c <fmtname+0x2c>
 247:	80 38 2f             	cmpb   $0x2f,(%eax)
 24a:	75 f4                	jne    240 <fmtname+0x20>
		;
	p++;
 24c:	8d 58 01             	lea    0x1(%eax),%ebx
	
	if(strlen(p) >= DIRSIZ)
 24f:	83 ec 0c             	sub    $0xc,%esp
 252:	53                   	push   %ebx
 253:	e8 e8 02 00 00       	call   540 <strlen>
 258:	83 c4 10             	add    $0x10,%esp
 25b:	83 f8 0d             	cmp    $0xd,%eax
 25e:	77 4a                	ja     2aa <fmtname+0x8a>
		return p;
	memmove(buf, p, strlen(p));
 260:	83 ec 0c             	sub    $0xc,%esp
 263:	53                   	push   %ebx
 264:	e8 d7 02 00 00       	call   540 <strlen>
 269:	83 c4 0c             	add    $0xc,%esp
 26c:	50                   	push   %eax
 26d:	53                   	push   %ebx
 26e:	68 20 10 00 00       	push   $0x1020
 273:	e8 58 04 00 00       	call   6d0 <memmove>
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 278:	89 1c 24             	mov    %ebx,(%esp)
 27b:	e8 c0 02 00 00       	call   540 <strlen>
 280:	89 1c 24             	mov    %ebx,(%esp)
 283:	89 c6                	mov    %eax,%esi
	return buf;
 285:	bb 20 10 00 00       	mov    $0x1020,%ebx
	p++;
	
	if(strlen(p) >= DIRSIZ)
		return p;
	memmove(buf, p, strlen(p));
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 28a:	e8 b1 02 00 00       	call   540 <strlen>
 28f:	ba 0e 00 00 00       	mov    $0xe,%edx
 294:	83 c4 0c             	add    $0xc,%esp
 297:	05 20 10 00 00       	add    $0x1020,%eax
 29c:	29 f2                	sub    %esi,%edx
 29e:	52                   	push   %edx
 29f:	6a 20                	push   $0x20
 2a1:	50                   	push   %eax
 2a2:	e8 c9 02 00 00       	call   570 <memset>
	return buf;
 2a7:	83 c4 10             	add    $0x10,%esp
}
 2aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ad:	89 d8                	mov    %ebx,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <ls>:

void ls(char *path)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
 2c5:	53                   	push   %ebx
 2c6:	81 ec 54 02 00 00    	sub    $0x254,%esp
 2cc:	8b 7d 08             	mov    0x8(%ebp),%edi
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
 2cf:	6a 00                	push   $0x0
 2d1:	57                   	push   %edi
 2d2:	e8 6b 04 00 00       	call   742 <open>
 2d7:	83 c4 10             	add    $0x10,%esp
 2da:	85 c0                	test   %eax,%eax
 2dc:	0f 88 66 01 00 00    	js     448 <ls+0x188>
	{
		printf(2, "Tidak dapat membuka %s\n", path);
		return;
	}
	
	if(fstat(fd, &st) < 0)
 2e2:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 2e8:	83 ec 08             	sub    $0x8,%esp
 2eb:	89 c3                	mov    %eax,%ebx
 2ed:	56                   	push   %esi
 2ee:	50                   	push   %eax
 2ef:	e8 66 04 00 00       	call   75a <fstat>
 2f4:	83 c4 10             	add    $0x10,%esp
 2f7:	85 c0                	test   %eax,%eax
 2f9:	0f 88 81 01 00 00    	js     480 <ls+0x1c0>
		printf(2, "Tidak dapat mengecek status %s\n", path);
		close(fd);
		return;
	}
	
	switch(st.type)
 2ff:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 306:	66 83 f8 01          	cmp    $0x1,%ax
 30a:	74 44                	je     350 <ls+0x90>
 30c:	66 83 f8 02          	cmp    $0x2,%ax
 310:	75 20                	jne    332 <ls+0x72>
	{
		case T_FILE:
		printf(1, "Nama = %s, Tipe = file, Ukuran = %d\n", fmtname(path), st.size);
 312:	83 ec 0c             	sub    $0xc,%esp
 315:	8b b5 e4 fd ff ff    	mov    -0x21c(%ebp),%esi
 31b:	57                   	push   %edi
 31c:	e8 ff fe ff ff       	call   220 <fmtname>
 321:	56                   	push   %esi
 322:	50                   	push   %eax
 323:	68 10 0c 00 00       	push   $0xc10
 328:	6a 01                	push   $0x1
 32a:	e8 21 05 00 00       	call   850 <printf>
		break;
 32f:	83 c4 20             	add    $0x20,%esp
			}
			printf(1, "Nama = %s, Tipe = directory, Ukuran = %d\n", fmtname(buf), st.size);
		}
		break;
	}
	close(fd);
 332:	83 ec 0c             	sub    $0xc,%esp
 335:	53                   	push   %ebx
 336:	e8 ef 03 00 00       	call   72a <close>
 33b:	83 c4 10             	add    $0x10,%esp
}
 33e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 341:	5b                   	pop    %ebx
 342:	5e                   	pop    %esi
 343:	5f                   	pop    %edi
 344:	5d                   	pop    %ebp
 345:	c3                   	ret    
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		case T_FILE:
		printf(1, "Nama = %s, Tipe = file, Ukuran = %d\n", fmtname(path), st.size);
		break;
		
		case T_DIR:
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
 350:	83 ec 0c             	sub    $0xc,%esp
 353:	57                   	push   %edi
 354:	e8 e7 01 00 00       	call   540 <strlen>
 359:	83 c0 10             	add    $0x10,%eax
 35c:	83 c4 10             	add    $0x10,%esp
 35f:	3d 00 02 00 00       	cmp    $0x200,%eax
 364:	0f 87 fe 00 00 00    	ja     468 <ls+0x1a8>
		{
			printf(1, "path terlalu panjang!\n");
			break;
		}
		strcpy(buf, path);
 36a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 370:	83 ec 08             	sub    $0x8,%esp
 373:	57                   	push   %edi
 374:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
 37a:	50                   	push   %eax
 37b:	e8 40 01 00 00       	call   4c0 <strcpy>
		p = buf+strlen(buf);
 380:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 386:	89 04 24             	mov    %eax,(%esp)
 389:	e8 b2 01 00 00       	call   540 <strlen>
 38e:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
		*p++ = '/';
		
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 394:	83 c4 10             	add    $0x10,%esp
		{
			printf(1, "path terlalu panjang!\n");
			break;
		}
		strcpy(buf, path);
		p = buf+strlen(buf);
 397:	01 c1                	add    %eax,%ecx
		*p++ = '/';
 399:	8d 84 05 e9 fd ff ff 	lea    -0x217(%ebp,%eax,1),%eax
		{
			printf(1, "path terlalu panjang!\n");
			break;
		}
		strcpy(buf, path);
		p = buf+strlen(buf);
 3a0:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
		*p++ = '/';
 3a6:	c6 01 2f             	movb   $0x2f,(%ecx)
 3a9:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 3af:	90                   	nop
		
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	6a 10                	push   $0x10
 3b5:	57                   	push   %edi
 3b6:	53                   	push   %ebx
 3b7:	e8 5e 03 00 00       	call   71a <read>
 3bc:	83 c4 10             	add    $0x10,%esp
 3bf:	83 f8 10             	cmp    $0x10,%eax
 3c2:	0f 85 6a ff ff ff    	jne    332 <ls+0x72>
		{
			if(de.inum == 0)
 3c8:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 3cf:	00 
 3d0:	74 de                	je     3b0 <ls+0xf0>
				continue;
			memmove(p, de.name, DIRSIZ);
 3d2:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 3d8:	83 ec 04             	sub    $0x4,%esp
 3db:	6a 0e                	push   $0xe
 3dd:	50                   	push   %eax
 3de:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
 3e4:	e8 e7 02 00 00       	call   6d0 <memmove>
			p[DIRSIZ] = 0;
 3e9:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
 3ef:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
			if(stat(buf, &st) < 0)
 3f3:	58                   	pop    %eax
 3f4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 3fa:	5a                   	pop    %edx
 3fb:	56                   	push   %esi
 3fc:	50                   	push   %eax
 3fd:	e8 3e 02 00 00       	call   640 <stat>
 402:	83 c4 10             	add    $0x10,%esp
 405:	85 c0                	test   %eax,%eax
 407:	0f 88 93 00 00 00    	js     4a0 <ls+0x1e0>
			{
				printf(1, "Tidak dapat mengecek status %s\n", buf);
				continue;
			}
			printf(1, "Nama = %s, Tipe = directory, Ukuran = %d\n", fmtname(buf), st.size);
 40d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 413:	83 ec 0c             	sub    $0xc,%esp
 416:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 41c:	50                   	push   %eax
 41d:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 423:	e8 f8 fd ff ff       	call   220 <fmtname>
 428:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 42e:	52                   	push   %edx
 42f:	50                   	push   %eax
 430:	68 38 0c 00 00       	push   $0xc38
 435:	6a 01                	push   $0x1
 437:	e8 14 04 00 00       	call   850 <printf>
 43c:	83 c4 20             	add    $0x20,%esp
 43f:	e9 6c ff ff ff       	jmp    3b0 <ls+0xf0>
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
	{
		printf(2, "Tidak dapat membuka %s\n", path);
 448:	83 ec 04             	sub    $0x4,%esp
 44b:	57                   	push   %edi
 44c:	68 70 0b 00 00       	push   $0xb70
 451:	6a 02                	push   $0x2
 453:	e8 f8 03 00 00       	call   850 <printf>
		return;
 458:	83 c4 10             	add    $0x10,%esp
			printf(1, "Nama = %s, Tipe = directory, Ukuran = %d\n", fmtname(buf), st.size);
		}
		break;
	}
	close(fd);
}
 45b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5f                   	pop    %edi
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    
 463:	90                   	nop
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		break;
		
		case T_DIR:
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
		{
			printf(1, "path terlalu panjang!\n");
 468:	83 ec 08             	sub    $0x8,%esp
 46b:	68 88 0b 00 00       	push   $0xb88
 470:	6a 01                	push   $0x1
 472:	e8 d9 03 00 00       	call   850 <printf>
			break;
 477:	83 c4 10             	add    $0x10,%esp
 47a:	e9 b3 fe ff ff       	jmp    332 <ls+0x72>
 47f:	90                   	nop
		return;
	}
	
	if(fstat(fd, &st) < 0)
	{
		printf(2, "Tidak dapat mengecek status %s\n", path);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	57                   	push   %edi
 484:	68 f0 0b 00 00       	push   $0xbf0
 489:	6a 02                	push   $0x2
 48b:	e8 c0 03 00 00       	call   850 <printf>
		close(fd);
 490:	89 1c 24             	mov    %ebx,(%esp)
 493:	e8 92 02 00 00       	call   72a <close>
		return;
 498:	83 c4 10             	add    $0x10,%esp
 49b:	e9 9e fe ff ff       	jmp    33e <ls+0x7e>
				continue;
			memmove(p, de.name, DIRSIZ);
			p[DIRSIZ] = 0;
			if(stat(buf, &st) < 0)
			{
				printf(1, "Tidak dapat mengecek status %s\n", buf);
 4a0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 4a6:	83 ec 04             	sub    $0x4,%esp
 4a9:	50                   	push   %eax
 4aa:	68 f0 0b 00 00       	push   $0xbf0
 4af:	6a 01                	push   $0x1
 4b1:	e8 9a 03 00 00       	call   850 <printf>
				continue;
 4b6:	83 c4 10             	add    $0x10,%esp
 4b9:	e9 f2 fe ff ff       	jmp    3b0 <ls+0xf0>
 4be:	66 90                	xchg   %ax,%ax

000004c0 <strcpy>:
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	53                   	push   %ebx
 4c4:	8b 45 08             	mov    0x8(%ebp),%eax
 4c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ca:	89 c2                	mov    %eax,%edx
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d0:	83 c1 01             	add    $0x1,%ecx
 4d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 4d7:	83 c2 01             	add    $0x1,%edx
 4da:	84 db                	test   %bl,%bl
 4dc:	88 5a ff             	mov    %bl,-0x1(%edx)
 4df:	75 ef                	jne    4d0 <strcpy+0x10>
 4e1:	5b                   	pop    %ebx
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000004f0 <strcmp>:
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
 4f5:	8b 55 08             	mov    0x8(%ebp),%edx
 4f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4fb:	0f b6 02             	movzbl (%edx),%eax
 4fe:	0f b6 19             	movzbl (%ecx),%ebx
 501:	84 c0                	test   %al,%al
 503:	75 1e                	jne    523 <strcmp+0x33>
 505:	eb 29                	jmp    530 <strcmp+0x40>
 507:	89 f6                	mov    %esi,%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 510:	83 c2 01             	add    $0x1,%edx
 513:	0f b6 02             	movzbl (%edx),%eax
 516:	8d 71 01             	lea    0x1(%ecx),%esi
 519:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 51d:	84 c0                	test   %al,%al
 51f:	74 0f                	je     530 <strcmp+0x40>
 521:	89 f1                	mov    %esi,%ecx
 523:	38 d8                	cmp    %bl,%al
 525:	74 e9                	je     510 <strcmp+0x20>
 527:	29 d8                	sub    %ebx,%eax
 529:	5b                   	pop    %ebx
 52a:	5e                   	pop    %esi
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	31 c0                	xor    %eax,%eax
 532:	29 d8                	sub    %ebx,%eax
 534:	5b                   	pop    %ebx
 535:	5e                   	pop    %esi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
 538:	90                   	nop
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <strlen>:
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	8b 4d 08             	mov    0x8(%ebp),%ecx
 546:	80 39 00             	cmpb   $0x0,(%ecx)
 549:	74 12                	je     55d <strlen+0x1d>
 54b:	31 d2                	xor    %edx,%edx
 54d:	8d 76 00             	lea    0x0(%esi),%esi
 550:	83 c2 01             	add    $0x1,%edx
 553:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 557:	89 d0                	mov    %edx,%eax
 559:	75 f5                	jne    550 <strlen+0x10>
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    
 55d:	31 c0                	xor    %eax,%eax
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    
 561:	eb 0d                	jmp    570 <memset>
 563:	90                   	nop
 564:	90                   	nop
 565:	90                   	nop
 566:	90                   	nop
 567:	90                   	nop
 568:	90                   	nop
 569:	90                   	nop
 56a:	90                   	nop
 56b:	90                   	nop
 56c:	90                   	nop
 56d:	90                   	nop
 56e:	90                   	nop
 56f:	90                   	nop

00000570 <memset>:
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	8b 55 08             	mov    0x8(%ebp),%edx
 577:	8b 4d 10             	mov    0x10(%ebp),%ecx
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	89 d7                	mov    %edx,%edi
 57f:	fc                   	cld    
 580:	f3 aa                	rep stos %al,%es:(%edi)
 582:	89 d0                	mov    %edx,%eax
 584:	5f                   	pop    %edi
 585:	5d                   	pop    %ebp
 586:	c3                   	ret    
 587:	89 f6                	mov    %esi,%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000590 <strchr>:
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	53                   	push   %ebx
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 59a:	0f b6 10             	movzbl (%eax),%edx
 59d:	84 d2                	test   %dl,%dl
 59f:	74 1d                	je     5be <strchr+0x2e>
 5a1:	38 d3                	cmp    %dl,%bl
 5a3:	89 d9                	mov    %ebx,%ecx
 5a5:	75 0d                	jne    5b4 <strchr+0x24>
 5a7:	eb 17                	jmp    5c0 <strchr+0x30>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b0:	38 ca                	cmp    %cl,%dl
 5b2:	74 0c                	je     5c0 <strchr+0x30>
 5b4:	83 c0 01             	add    $0x1,%eax
 5b7:	0f b6 10             	movzbl (%eax),%edx
 5ba:	84 d2                	test   %dl,%dl
 5bc:	75 f2                	jne    5b0 <strchr+0x20>
 5be:	31 c0                	xor    %eax,%eax
 5c0:	5b                   	pop    %ebx
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    
 5c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <gets>:
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	31 f6                	xor    %esi,%esi
 5d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5db:	83 ec 1c             	sub    $0x1c,%esp
 5de:	eb 29                	jmp    609 <gets+0x39>
 5e0:	83 ec 04             	sub    $0x4,%esp
 5e3:	6a 01                	push   $0x1
 5e5:	57                   	push   %edi
 5e6:	6a 00                	push   $0x0
 5e8:	e8 2d 01 00 00       	call   71a <read>
 5ed:	83 c4 10             	add    $0x10,%esp
 5f0:	85 c0                	test   %eax,%eax
 5f2:	7e 1d                	jle    611 <gets+0x41>
 5f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5f8:	8b 55 08             	mov    0x8(%ebp),%edx
 5fb:	89 de                	mov    %ebx,%esi
 5fd:	3c 0a                	cmp    $0xa,%al
 5ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 603:	74 1b                	je     620 <gets+0x50>
 605:	3c 0d                	cmp    $0xd,%al
 607:	74 17                	je     620 <gets+0x50>
 609:	8d 5e 01             	lea    0x1(%esi),%ebx
 60c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 60f:	7c cf                	jl     5e0 <gets+0x10>
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 618:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61b:	5b                   	pop    %ebx
 61c:	5e                   	pop    %esi
 61d:	5f                   	pop    %edi
 61e:	5d                   	pop    %ebp
 61f:	c3                   	ret    
 620:	8b 45 08             	mov    0x8(%ebp),%eax
 623:	89 de                	mov    %ebx,%esi
 625:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 629:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62c:	5b                   	pop    %ebx
 62d:	5e                   	pop    %esi
 62e:	5f                   	pop    %edi
 62f:	5d                   	pop    %ebp
 630:	c3                   	ret    
 631:	eb 0d                	jmp    640 <stat>
 633:	90                   	nop
 634:	90                   	nop
 635:	90                   	nop
 636:	90                   	nop
 637:	90                   	nop
 638:	90                   	nop
 639:	90                   	nop
 63a:	90                   	nop
 63b:	90                   	nop
 63c:	90                   	nop
 63d:	90                   	nop
 63e:	90                   	nop
 63f:	90                   	nop

00000640 <stat>:
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	56                   	push   %esi
 644:	53                   	push   %ebx
 645:	83 ec 08             	sub    $0x8,%esp
 648:	6a 00                	push   $0x0
 64a:	ff 75 08             	pushl  0x8(%ebp)
 64d:	e8 f0 00 00 00       	call   742 <open>
 652:	83 c4 10             	add    $0x10,%esp
 655:	85 c0                	test   %eax,%eax
 657:	78 27                	js     680 <stat+0x40>
 659:	83 ec 08             	sub    $0x8,%esp
 65c:	ff 75 0c             	pushl  0xc(%ebp)
 65f:	89 c3                	mov    %eax,%ebx
 661:	50                   	push   %eax
 662:	e8 f3 00 00 00       	call   75a <fstat>
 667:	89 c6                	mov    %eax,%esi
 669:	89 1c 24             	mov    %ebx,(%esp)
 66c:	e8 b9 00 00 00       	call   72a <close>
 671:	83 c4 10             	add    $0x10,%esp
 674:	89 f0                	mov    %esi,%eax
 676:	8d 65 f8             	lea    -0x8(%ebp),%esp
 679:	5b                   	pop    %ebx
 67a:	5e                   	pop    %esi
 67b:	5d                   	pop    %ebp
 67c:	c3                   	ret    
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 685:	eb ef                	jmp    676 <stat+0x36>
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000690 <atoi>:
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	8b 4d 08             	mov    0x8(%ebp),%ecx
 697:	0f be 11             	movsbl (%ecx),%edx
 69a:	8d 42 d0             	lea    -0x30(%edx),%eax
 69d:	3c 09                	cmp    $0x9,%al
 69f:	b8 00 00 00 00       	mov    $0x0,%eax
 6a4:	77 1f                	ja     6c5 <atoi+0x35>
 6a6:	8d 76 00             	lea    0x0(%esi),%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 6b3:	83 c1 01             	add    $0x1,%ecx
 6b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 6ba:	0f be 11             	movsbl (%ecx),%edx
 6bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 6c0:	80 fb 09             	cmp    $0x9,%bl
 6c3:	76 eb                	jbe    6b0 <atoi+0x20>
 6c5:	5b                   	pop    %ebx
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006d0 <memmove>:
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	56                   	push   %esi
 6d4:	53                   	push   %ebx
 6d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	8b 75 0c             	mov    0xc(%ebp),%esi
 6de:	85 db                	test   %ebx,%ebx
 6e0:	7e 14                	jle    6f6 <memmove+0x26>
 6e2:	31 d2                	xor    %edx,%edx
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 6ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 6ef:	83 c2 01             	add    $0x1,%edx
 6f2:	39 da                	cmp    %ebx,%edx
 6f4:	75 f2                	jne    6e8 <memmove+0x18>
 6f6:	5b                   	pop    %ebx
 6f7:	5e                   	pop    %esi
 6f8:	5d                   	pop    %ebp
 6f9:	c3                   	ret    

000006fa <fork>:
 6fa:	b8 01 00 00 00       	mov    $0x1,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <exit>:
 702:	b8 02 00 00 00       	mov    $0x2,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <wait>:
 70a:	b8 03 00 00 00       	mov    $0x3,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <pipe>:
 712:	b8 04 00 00 00       	mov    $0x4,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <read>:
 71a:	b8 05 00 00 00       	mov    $0x5,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <write>:
 722:	b8 10 00 00 00       	mov    $0x10,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <close>:
 72a:	b8 15 00 00 00       	mov    $0x15,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <kill>:
 732:	b8 06 00 00 00       	mov    $0x6,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <exec>:
 73a:	b8 07 00 00 00       	mov    $0x7,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <open>:
 742:	b8 0f 00 00 00       	mov    $0xf,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <mknod>:
 74a:	b8 11 00 00 00       	mov    $0x11,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <unlink>:
 752:	b8 12 00 00 00       	mov    $0x12,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <fstat>:
 75a:	b8 08 00 00 00       	mov    $0x8,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <link>:
 762:	b8 13 00 00 00       	mov    $0x13,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <mkdir>:
 76a:	b8 14 00 00 00       	mov    $0x14,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <chdir>:
 772:	b8 09 00 00 00       	mov    $0x9,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <dup>:
 77a:	b8 0a 00 00 00       	mov    $0xa,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <getpid>:
 782:	b8 0b 00 00 00       	mov    $0xb,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <sbrk>:
 78a:	b8 0c 00 00 00       	mov    $0xc,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <sleep>:
 792:	b8 0d 00 00 00       	mov    $0xd,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <uptime>:
 79a:	b8 0e 00 00 00       	mov    $0xe,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <mkfile>:
 7a2:	b8 16 00 00 00       	mov    $0x16,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    
 7aa:	66 90                	xchg   %ax,%ax
 7ac:	66 90                	xchg   %ax,%ax
 7ae:	66 90                	xchg   %ax,%ax

000007b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	89 c6                	mov    %eax,%esi
 7b8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7be:	85 db                	test   %ebx,%ebx
 7c0:	74 7e                	je     840 <printint+0x90>
 7c2:	89 d0                	mov    %edx,%eax
 7c4:	c1 e8 1f             	shr    $0x1f,%eax
 7c7:	84 c0                	test   %al,%al
 7c9:	74 75                	je     840 <printint+0x90>
    neg = 1;
    x = -xx;
 7cb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7cd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 7d4:	f7 d8                	neg    %eax
 7d6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7d9:	31 ff                	xor    %edi,%edi
 7db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 7de:	89 ce                	mov    %ecx,%esi
 7e0:	eb 08                	jmp    7ea <printint+0x3a>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7e8:	89 cf                	mov    %ecx,%edi
 7ea:	31 d2                	xor    %edx,%edx
 7ec:	8d 4f 01             	lea    0x1(%edi),%ecx
 7ef:	f7 f6                	div    %esi
 7f1:	0f b6 92 fc 0c 00 00 	movzbl 0xcfc(%edx),%edx
  }while((x /= base) != 0);
 7f8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 7fa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 7fd:	75 e9                	jne    7e8 <printint+0x38>
  if(neg)
 7ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 802:	8b 75 c0             	mov    -0x40(%ebp),%esi
 805:	85 c0                	test   %eax,%eax
 807:	74 08                	je     811 <printint+0x61>
    buf[i++] = '-';
 809:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 80e:	8d 4f 02             	lea    0x2(%edi),%ecx
 811:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 815:	8d 76 00             	lea    0x0(%esi),%esi
 818:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 81b:	83 ec 04             	sub    $0x4,%esp
 81e:	83 ef 01             	sub    $0x1,%edi
 821:	6a 01                	push   $0x1
 823:	53                   	push   %ebx
 824:	56                   	push   %esi
 825:	88 45 d7             	mov    %al,-0x29(%ebp)
 828:	e8 f5 fe ff ff       	call   722 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 82d:	83 c4 10             	add    $0x10,%esp
 830:	39 df                	cmp    %ebx,%edi
 832:	75 e4                	jne    818 <printint+0x68>
    putc(fd, buf[i]);
}
 834:	8d 65 f4             	lea    -0xc(%ebp),%esp
 837:	5b                   	pop    %ebx
 838:	5e                   	pop    %esi
 839:	5f                   	pop    %edi
 83a:	5d                   	pop    %ebp
 83b:	c3                   	ret    
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 840:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 842:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 849:	eb 8b                	jmp    7d6 <printint+0x26>
 84b:	90                   	nop
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 856:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 859:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 85c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 85f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 862:	89 45 d0             	mov    %eax,-0x30(%ebp)
 865:	0f b6 1e             	movzbl (%esi),%ebx
 868:	83 c6 01             	add    $0x1,%esi
 86b:	84 db                	test   %bl,%bl
 86d:	0f 84 b0 00 00 00    	je     923 <printf+0xd3>
 873:	31 d2                	xor    %edx,%edx
 875:	eb 39                	jmp    8b0 <printf+0x60>
 877:	89 f6                	mov    %esi,%esi
 879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 880:	83 f8 25             	cmp    $0x25,%eax
 883:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 886:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 88b:	74 18                	je     8a5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 88d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 890:	83 ec 04             	sub    $0x4,%esp
 893:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 896:	6a 01                	push   $0x1
 898:	50                   	push   %eax
 899:	57                   	push   %edi
 89a:	e8 83 fe ff ff       	call   722 <write>
 89f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8a2:	83 c4 10             	add    $0x10,%esp
 8a5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 8ac:	84 db                	test   %bl,%bl
 8ae:	74 73                	je     923 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 8b0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 8b2:	0f be cb             	movsbl %bl,%ecx
 8b5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 8b8:	74 c6                	je     880 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8ba:	83 fa 25             	cmp    $0x25,%edx
 8bd:	75 e6                	jne    8a5 <printf+0x55>
      if(c == 'd'){
 8bf:	83 f8 64             	cmp    $0x64,%eax
 8c2:	0f 84 f8 00 00 00    	je     9c0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8c8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 8ce:	83 f9 70             	cmp    $0x70,%ecx
 8d1:	74 5d                	je     930 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8d3:	83 f8 73             	cmp    $0x73,%eax
 8d6:	0f 84 84 00 00 00    	je     960 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8dc:	83 f8 63             	cmp    $0x63,%eax
 8df:	0f 84 ea 00 00 00    	je     9cf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8e5:	83 f8 25             	cmp    $0x25,%eax
 8e8:	0f 84 c2 00 00 00    	je     9b0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8f1:	83 ec 04             	sub    $0x4,%esp
 8f4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8f8:	6a 01                	push   $0x1
 8fa:	50                   	push   %eax
 8fb:	57                   	push   %edi
 8fc:	e8 21 fe ff ff       	call   722 <write>
 901:	83 c4 0c             	add    $0xc,%esp
 904:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 907:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 90a:	6a 01                	push   $0x1
 90c:	50                   	push   %eax
 90d:	57                   	push   %edi
 90e:	83 c6 01             	add    $0x1,%esi
 911:	e8 0c fe ff ff       	call   722 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 916:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 91a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 91d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 91f:	84 db                	test   %bl,%bl
 921:	75 8d                	jne    8b0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 923:	8d 65 f4             	lea    -0xc(%ebp),%esp
 926:	5b                   	pop    %ebx
 927:	5e                   	pop    %esi
 928:	5f                   	pop    %edi
 929:	5d                   	pop    %ebp
 92a:	c3                   	ret    
 92b:	90                   	nop
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 930:	83 ec 0c             	sub    $0xc,%esp
 933:	b9 10 00 00 00       	mov    $0x10,%ecx
 938:	6a 00                	push   $0x0
 93a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 93d:	89 f8                	mov    %edi,%eax
 93f:	8b 13                	mov    (%ebx),%edx
 941:	e8 6a fe ff ff       	call   7b0 <printint>
        ap++;
 946:	89 d8                	mov    %ebx,%eax
 948:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 94b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 94d:	83 c0 04             	add    $0x4,%eax
 950:	89 45 d0             	mov    %eax,-0x30(%ebp)
 953:	e9 4d ff ff ff       	jmp    8a5 <printf+0x55>
 958:	90                   	nop
 959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 960:	8b 45 d0             	mov    -0x30(%ebp),%eax
 963:	8b 18                	mov    (%eax),%ebx
        ap++;
 965:	83 c0 04             	add    $0x4,%eax
 968:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 96b:	b8 f4 0c 00 00       	mov    $0xcf4,%eax
 970:	85 db                	test   %ebx,%ebx
 972:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 975:	0f b6 03             	movzbl (%ebx),%eax
 978:	84 c0                	test   %al,%al
 97a:	74 23                	je     99f <printf+0x14f>
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 980:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 983:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 986:	83 ec 04             	sub    $0x4,%esp
 989:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 98b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 98e:	50                   	push   %eax
 98f:	57                   	push   %edi
 990:	e8 8d fd ff ff       	call   722 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 995:	0f b6 03             	movzbl (%ebx),%eax
 998:	83 c4 10             	add    $0x10,%esp
 99b:	84 c0                	test   %al,%al
 99d:	75 e1                	jne    980 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 99f:	31 d2                	xor    %edx,%edx
 9a1:	e9 ff fe ff ff       	jmp    8a5 <printf+0x55>
 9a6:	8d 76 00             	lea    0x0(%esi),%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b0:	83 ec 04             	sub    $0x4,%esp
 9b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 9b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 9b9:	6a 01                	push   $0x1
 9bb:	e9 4c ff ff ff       	jmp    90c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9c0:	83 ec 0c             	sub    $0xc,%esp
 9c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9c8:	6a 01                	push   $0x1
 9ca:	e9 6b ff ff ff       	jmp    93a <printf+0xea>
 9cf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9d2:	83 ec 04             	sub    $0x4,%esp
 9d5:	8b 03                	mov    (%ebx),%eax
 9d7:	6a 01                	push   $0x1
 9d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 9dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 9df:	50                   	push   %eax
 9e0:	57                   	push   %edi
 9e1:	e8 3c fd ff ff       	call   722 <write>
 9e6:	e9 5b ff ff ff       	jmp    946 <printf+0xf6>
 9eb:	66 90                	xchg   %ax,%ax
 9ed:	66 90                	xchg   %ax,%ax
 9ef:	90                   	nop

000009f0 <free>:
 9f0:	55                   	push   %ebp
 9f1:	a1 30 10 00 00       	mov    0x1030,%eax
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	57                   	push   %edi
 9f9:	56                   	push   %esi
 9fa:	53                   	push   %ebx
 9fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9fe:	8b 10                	mov    (%eax),%edx
 a00:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 a03:	39 c8                	cmp    %ecx,%eax
 a05:	73 19                	jae    a20 <free+0x30>
 a07:	89 f6                	mov    %esi,%esi
 a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 a10:	39 d1                	cmp    %edx,%ecx
 a12:	72 1c                	jb     a30 <free+0x40>
 a14:	39 d0                	cmp    %edx,%eax
 a16:	73 18                	jae    a30 <free+0x40>
 a18:	89 d0                	mov    %edx,%eax
 a1a:	39 c8                	cmp    %ecx,%eax
 a1c:	8b 10                	mov    (%eax),%edx
 a1e:	72 f0                	jb     a10 <free+0x20>
 a20:	39 d0                	cmp    %edx,%eax
 a22:	72 f4                	jb     a18 <free+0x28>
 a24:	39 d1                	cmp    %edx,%ecx
 a26:	73 f0                	jae    a18 <free+0x28>
 a28:	90                   	nop
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a30:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a33:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a36:	39 d7                	cmp    %edx,%edi
 a38:	74 19                	je     a53 <free+0x63>
 a3a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a3d:	8b 50 04             	mov    0x4(%eax),%edx
 a40:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a43:	39 f1                	cmp    %esi,%ecx
 a45:	74 23                	je     a6a <free+0x7a>
 a47:	89 08                	mov    %ecx,(%eax)
 a49:	a3 30 10 00 00       	mov    %eax,0x1030
 a4e:	5b                   	pop    %ebx
 a4f:	5e                   	pop    %esi
 a50:	5f                   	pop    %edi
 a51:	5d                   	pop    %ebp
 a52:	c3                   	ret    
 a53:	03 72 04             	add    0x4(%edx),%esi
 a56:	89 73 fc             	mov    %esi,-0x4(%ebx)
 a59:	8b 10                	mov    (%eax),%edx
 a5b:	8b 12                	mov    (%edx),%edx
 a5d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a60:	8b 50 04             	mov    0x4(%eax),%edx
 a63:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a66:	39 f1                	cmp    %esi,%ecx
 a68:	75 dd                	jne    a47 <free+0x57>
 a6a:	03 53 fc             	add    -0x4(%ebx),%edx
 a6d:	a3 30 10 00 00       	mov    %eax,0x1030
 a72:	89 50 04             	mov    %edx,0x4(%eax)
 a75:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a78:	89 10                	mov    %edx,(%eax)
 a7a:	5b                   	pop    %ebx
 a7b:	5e                   	pop    %esi
 a7c:	5f                   	pop    %edi
 a7d:	5d                   	pop    %ebp
 a7e:	c3                   	ret    
 a7f:	90                   	nop

00000a80 <malloc>:
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	57                   	push   %edi
 a84:	56                   	push   %esi
 a85:	53                   	push   %ebx
 a86:	83 ec 0c             	sub    $0xc,%esp
 a89:	8b 45 08             	mov    0x8(%ebp),%eax
 a8c:	8b 15 30 10 00 00    	mov    0x1030,%edx
 a92:	8d 78 07             	lea    0x7(%eax),%edi
 a95:	c1 ef 03             	shr    $0x3,%edi
 a98:	83 c7 01             	add    $0x1,%edi
 a9b:	85 d2                	test   %edx,%edx
 a9d:	0f 84 a3 00 00 00    	je     b46 <malloc+0xc6>
 aa3:	8b 02                	mov    (%edx),%eax
 aa5:	8b 48 04             	mov    0x4(%eax),%ecx
 aa8:	39 cf                	cmp    %ecx,%edi
 aaa:	76 74                	jbe    b20 <malloc+0xa0>
 aac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 ab2:	be 00 10 00 00       	mov    $0x1000,%esi
 ab7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 abe:	0f 43 f7             	cmovae %edi,%esi
 ac1:	ba 00 80 00 00       	mov    $0x8000,%edx
 ac6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 acc:	0f 46 da             	cmovbe %edx,%ebx
 acf:	eb 10                	jmp    ae1 <malloc+0x61>
 ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad8:	8b 02                	mov    (%edx),%eax
 ada:	8b 48 04             	mov    0x4(%eax),%ecx
 add:	39 cf                	cmp    %ecx,%edi
 adf:	76 3f                	jbe    b20 <malloc+0xa0>
 ae1:	39 05 30 10 00 00    	cmp    %eax,0x1030
 ae7:	89 c2                	mov    %eax,%edx
 ae9:	75 ed                	jne    ad8 <malloc+0x58>
 aeb:	83 ec 0c             	sub    $0xc,%esp
 aee:	53                   	push   %ebx
 aef:	e8 96 fc ff ff       	call   78a <sbrk>
 af4:	83 c4 10             	add    $0x10,%esp
 af7:	83 f8 ff             	cmp    $0xffffffff,%eax
 afa:	74 1c                	je     b18 <malloc+0x98>
 afc:	89 70 04             	mov    %esi,0x4(%eax)
 aff:	83 ec 0c             	sub    $0xc,%esp
 b02:	83 c0 08             	add    $0x8,%eax
 b05:	50                   	push   %eax
 b06:	e8 e5 fe ff ff       	call   9f0 <free>
 b0b:	8b 15 30 10 00 00    	mov    0x1030,%edx
 b11:	83 c4 10             	add    $0x10,%esp
 b14:	85 d2                	test   %edx,%edx
 b16:	75 c0                	jne    ad8 <malloc+0x58>
 b18:	31 c0                	xor    %eax,%eax
 b1a:	eb 1c                	jmp    b38 <malloc+0xb8>
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b20:	39 cf                	cmp    %ecx,%edi
 b22:	74 1c                	je     b40 <malloc+0xc0>
 b24:	29 f9                	sub    %edi,%ecx
 b26:	89 48 04             	mov    %ecx,0x4(%eax)
 b29:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 b2c:	89 78 04             	mov    %edi,0x4(%eax)
 b2f:	89 15 30 10 00 00    	mov    %edx,0x1030
 b35:	83 c0 08             	add    $0x8,%eax
 b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b3b:	5b                   	pop    %ebx
 b3c:	5e                   	pop    %esi
 b3d:	5f                   	pop    %edi
 b3e:	5d                   	pop    %ebp
 b3f:	c3                   	ret    
 b40:	8b 08                	mov    (%eax),%ecx
 b42:	89 0a                	mov    %ecx,(%edx)
 b44:	eb e9                	jmp    b2f <malloc+0xaf>
 b46:	c7 05 30 10 00 00 34 	movl   $0x1034,0x1030
 b4d:	10 00 00 
 b50:	c7 05 34 10 00 00 34 	movl   $0x1034,0x1034
 b57:	10 00 00 
 b5a:	b8 34 10 00 00       	mov    $0x1034,%eax
 b5f:	c7 05 38 10 00 00 00 	movl   $0x0,0x1038
 b66:	00 00 00 
 b69:	e9 3e ff ff ff       	jmp    aac <malloc+0x2c>
