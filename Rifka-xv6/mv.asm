
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
	//判断参数
	if (argc !=3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)

void ls(char *path);
char* fmtname(char *path);

int main(int argc, char *argv[])
{
  1a:	8b 71 04             	mov    0x4(%ecx),%esi
	//判断参数
	if (argc !=3)
  1d:	74 14                	je     33 <main+0x33>
	{
		printf(1, "please input the command as [mv src_file dest_file]\n");
  1f:	83 ec 08             	sub    $0x8,%esp
  22:	68 18 0c 00 00       	push   $0xc18
  27:	6a 01                	push   $0x1
  29:	e8 02 08 00 00       	call   830 <printf>
		exit();
  2e:	e8 af 06 00 00       	call   6e2 <exit>
	}
	
	//打开源文件
	int fd_src = open(argv[1], O_RDONLY);
  33:	50                   	push   %eax
  34:	50                   	push   %eax
  35:	6a 00                	push   $0x0
  37:	ff 76 04             	pushl  0x4(%esi)
  3a:	e8 e3 06 00 00       	call   722 <open>
	if (fd_src == -1)
  3f:	83 c4 10             	add    $0x10,%esp
		printf(1, "please input the command as [mv src_file dest_file]\n");
		exit();
	}
	
	//打开源文件
	int fd_src = open(argv[1], O_RDONLY);
  42:	89 85 44 fe ff ff    	mov    %eax,-0x1bc(%ebp)
	if (fd_src == -1)
  48:	83 c0 01             	add    $0x1,%eax
  4b:	0f 84 38 01 00 00    	je     189 <main+0x189>
		exit();
	}
	
	//判断源文件状态是否为文件夹
	struct stat st;
	fstat(fd_src, &st);
  51:	8d 85 54 fe ff ff    	lea    -0x1ac(%ebp),%eax
  57:	57                   	push   %edi
  58:	57                   	push   %edi
  59:	50                   	push   %eax
  5a:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
  60:	e8 d5 06 00 00       	call   73a <fstat>
	if (st.type == T_DIR)
  65:	83 c4 10             	add    $0x10,%esp
  68:	66 83 bd 54 fe ff ff 	cmpw   $0x1,-0x1ac(%ebp)
  6f:	01 
  70:	0f 84 db 00 00 00    	je     151 <main+0x151>
		printf(1, "So, I'm sorry that you have to move them one by one.\n");
		exit();
	}

	//判断第二个参数是不是以"/"结尾，如果是，则补全路径
	char com[128] = {};
  76:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  7c:	31 c0                	xor    %eax,%eax
  7e:	b9 20 00 00 00       	mov    $0x20,%ecx
  83:	f3 ab                	rep stos %eax,%es:(%edi)
	strcpy(com, argv[2]);
  85:	57                   	push   %edi
  86:	57                   	push   %edi
  87:	8d bd 68 fe ff ff    	lea    -0x198(%ebp),%edi
  8d:	ff 76 08             	pushl  0x8(%esi)
  90:	57                   	push   %edi
  91:	e8 0a 04 00 00       	call   4a0 <strcpy>
	int len1 = strlen(argv[1]);
  96:	58                   	pop    %eax
  97:	ff 76 04             	pushl  0x4(%esi)
  9a:	e8 81 04 00 00       	call   520 <strlen>
  9f:	89 c3                	mov    %eax,%ebx
	int len2 = strlen(argv[2]);
  a1:	58                   	pop    %eax
  a2:	ff 76 08             	pushl  0x8(%esi)
  a5:	e8 76 04 00 00       	call   520 <strlen>
	if (argv[2][len2-1] == '/')
  aa:	8b 56 08             	mov    0x8(%esi),%edx
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	80 7c 02 ff 2f       	cmpb   $0x2f,-0x1(%edx,%eax,1)
  b5:	0f 84 e1 00 00 00    	je     19c <main+0x19c>
		i++;
		strcpy(&com[len2], &argv[1][i]);
	}
	
	//打开目标文件
	int fd_dest = open(com, O_WRONLY|O_CREATE);
  bb:	50                   	push   %eax
  bc:	50                   	push   %eax
  bd:	68 01 02 00 00       	push   $0x201
  c2:	57                   	push   %edi
  c3:	e8 5a 06 00 00       	call   722 <open>
	if (fd_dest == -1)
  c8:	83 c4 10             	add    $0x10,%esp
		i++;
		strcpy(&com[len2], &argv[1][i]);
	}
	
	//打开目标文件
	int fd_dest = open(com, O_WRONLY|O_CREATE);
  cb:	89 85 40 fe ff ff    	mov    %eax,-0x1c0(%ebp)
	if (fd_dest == -1)
  d1:	83 c0 01             	add    $0x1,%eax
  d4:	0f 84 ee 00 00 00    	je     1c8 <main+0x1c8>
		printf(1, "create dest file failed\n");
		exit();
	}
	
	//复制文件
	char buf[BUF_SIZE] = {};
  da:	8d 9d e8 fe ff ff    	lea    -0x118(%ebp),%ebx
  e0:	b9 40 00 00 00       	mov    $0x40,%ecx
  e5:	31 c0                	xor    %eax,%eax
  e7:	89 df                	mov    %ebx,%edi
  e9:	f3 ab                	rep stos %eax,%es:(%edi)
	int len = 0;
	while((len = read(fd_src, buf, BUF_SIZE)) > 0)
  eb:	eb 16                	jmp    103 <main+0x103>
  ed:	8d 76 00             	lea    0x0(%esi),%esi
		write(fd_dest, buf, len);
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	50                   	push   %eax
  f4:	53                   	push   %ebx
  f5:	ff b5 40 fe ff ff    	pushl  -0x1c0(%ebp)
  fb:	e8 02 06 00 00       	call   702 <write>
 100:	83 c4 10             	add    $0x10,%esp
	}
	
	//复制文件
	char buf[BUF_SIZE] = {};
	int len = 0;
	while((len = read(fd_src, buf, BUF_SIZE)) > 0)
 103:	83 ec 04             	sub    $0x4,%esp
 106:	68 00 01 00 00       	push   $0x100
 10b:	53                   	push   %ebx
 10c:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
 112:	e8 e3 05 00 00       	call   6fa <read>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	7f d2                	jg     f0 <main+0xf0>
		write(fd_dest, buf, len);
	
	//关闭文件
	close(fd_src);
 11e:	83 ec 0c             	sub    $0xc,%esp
 121:	ff b5 44 fe ff ff    	pushl  -0x1bc(%ebp)
 127:	e8 de 05 00 00       	call   70a <close>
	close(fd_dest);
 12c:	5a                   	pop    %edx
 12d:	ff b5 40 fe ff ff    	pushl  -0x1c0(%ebp)
 133:	e8 d2 05 00 00       	call   70a <close>
	
	//删除源文件
	if(unlink(argv[1]) < 0)
 138:	59                   	pop    %ecx
 139:	ff 76 04             	pushl  0x4(%esi)
 13c:	e8 f1 05 00 00       	call   732 <unlink>
 141:	83 c4 10             	add    $0x10,%esp
 144:	85 c0                	test   %eax,%eax
 146:	0f 88 8f 00 00 00    	js     1db <main+0x1db>
		printf(1, "delete source file failed\n");
	
	//关闭程序
	exit();
 14c:	e8 91 05 00 00       	call   6e2 <exit>
	//判断源文件状态是否为文件夹
	struct stat st;
	fstat(fd_src, &st);
	if (st.type == T_DIR)
	{
		printf(1, "source file is a directory, the files in that directory is:\n");
 151:	50                   	push   %eax
 152:	50                   	push   %eax
 153:	68 50 0c 00 00       	push   $0xc50
 158:	6a 01                	push   $0x1
 15a:	e8 d1 06 00 00       	call   830 <printf>
		ls(argv[1]);
 15f:	58                   	pop    %eax
 160:	ff 76 04             	pushl  0x4(%esi)
 163:	e8 38 01 00 00       	call   2a0 <ls>
		printf(1, "the program can't open the file in that directory after list them.\n");
 168:	58                   	pop    %eax
 169:	5a                   	pop    %edx
 16a:	68 90 0c 00 00       	push   $0xc90
 16f:	6a 01                	push   $0x1
 171:	e8 ba 06 00 00       	call   830 <printf>
		printf(1, "So, I'm sorry that you have to move them one by one.\n");
 176:	59                   	pop    %ecx
 177:	5b                   	pop    %ebx
 178:	68 d4 0c 00 00       	push   $0xcd4
 17d:	6a 01                	push   $0x1
 17f:	e8 ac 06 00 00       	call   830 <printf>
		exit();
 184:	e8 59 05 00 00       	call   6e2 <exit>
	
	//打开源文件
	int fd_src = open(argv[1], O_RDONLY);
	if (fd_src == -1)
	{
		printf(1, "open source file failed\n");
 189:	50                   	push   %eax
 18a:	50                   	push   %eax
 18b:	68 7f 0b 00 00       	push   $0xb7f
 190:	6a 01                	push   $0x1
 192:	e8 99 06 00 00       	call   830 <printf>
		exit();
 197:	e8 46 05 00 00       	call   6e2 <exit>
	int len1 = strlen(argv[1]);
	int len2 = strlen(argv[2]);
	if (argv[2][len2-1] == '/')
	{
		//找到argv[1]中的文件名
		int i = len1 - 1;
 19c:	8d 53 ff             	lea    -0x1(%ebx),%edx
 19f:	8b 4e 04             	mov    0x4(%esi),%ecx
		for (; i >= 0; i--)
 1a2:	eb 09                	jmp    1ad <main+0x1ad>
			if (argv[1][i] == '/')
 1a4:	80 3c 11 2f          	cmpb   $0x2f,(%ecx,%edx,1)
 1a8:	74 07                	je     1b1 <main+0x1b1>
	int len2 = strlen(argv[2]);
	if (argv[2][len2-1] == '/')
	{
		//找到argv[1]中的文件名
		int i = len1 - 1;
		for (; i >= 0; i--)
 1aa:	83 ea 01             	sub    $0x1,%edx
 1ad:	85 d2                	test   %edx,%edx
 1af:	79 f3                	jns    1a4 <main+0x1a4>
			if (argv[1][i] == '/')
				break;
		i++;
		strcpy(&com[len2], &argv[1][i]);
 1b1:	8d 54 11 01          	lea    0x1(%ecx,%edx,1),%edx
 1b5:	01 f8                	add    %edi,%eax
 1b7:	53                   	push   %ebx
 1b8:	53                   	push   %ebx
 1b9:	52                   	push   %edx
 1ba:	50                   	push   %eax
 1bb:	e8 e0 02 00 00       	call   4a0 <strcpy>
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	e9 f3 fe ff ff       	jmp    bb <main+0xbb>
	
	//打开目标文件
	int fd_dest = open(com, O_WRONLY|O_CREATE);
	if (fd_dest == -1)
	{
		printf(1, "create dest file failed\n");
 1c8:	53                   	push   %ebx
 1c9:	53                   	push   %ebx
 1ca:	68 98 0b 00 00       	push   $0xb98
 1cf:	6a 01                	push   $0x1
 1d1:	e8 5a 06 00 00       	call   830 <printf>
		exit();
 1d6:	e8 07 05 00 00       	call   6e2 <exit>
	close(fd_src);
	close(fd_dest);
	
	//删除源文件
	if(unlink(argv[1]) < 0)
		printf(1, "delete source file failed\n");
 1db:	50                   	push   %eax
 1dc:	50                   	push   %eax
 1dd:	68 b1 0b 00 00       	push   $0xbb1
 1e2:	6a 01                	push   $0x1
 1e4:	e8 47 06 00 00       	call   830 <printf>
 1e9:	83 c4 10             	add    $0x10,%esp
 1ec:	e9 5b ff ff ff       	jmp    14c <main+0x14c>
 1f1:	66 90                	xchg   %ax,%ax
 1f3:	66 90                	xchg   %ax,%ax
 1f5:	66 90                	xchg   %ax,%ax
 1f7:	66 90                	xchg   %ax,%ax
 1f9:	66 90                	xchg   %ax,%ax
 1fb:	66 90                	xchg   %ax,%ax
 1fd:	66 90                	xchg   %ax,%ax
 1ff:	90                   	nop

00000200 <fmtname>:
	//关闭程序
	exit();
}

char* fmtname(char *path)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	8b 5d 08             	mov    0x8(%ebp),%ebx
	static char buf[DIRSIZ+1];
	char *p;
	
	// Find first character after last slash.
	for(p=path+strlen(path); p >= path && *p != '/'; p--)
 208:	83 ec 0c             	sub    $0xc,%esp
 20b:	53                   	push   %ebx
 20c:	e8 0f 03 00 00       	call   520 <strlen>
 211:	83 c4 10             	add    $0x10,%esp
 214:	01 d8                	add    %ebx,%eax
 216:	73 0f                	jae    227 <fmtname+0x27>
 218:	eb 12                	jmp    22c <fmtname+0x2c>
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 220:	83 e8 01             	sub    $0x1,%eax
 223:	39 c3                	cmp    %eax,%ebx
 225:	77 05                	ja     22c <fmtname+0x2c>
 227:	80 38 2f             	cmpb   $0x2f,(%eax)
 22a:	75 f4                	jne    220 <fmtname+0x20>
		;
	p++;
 22c:	8d 58 01             	lea    0x1(%eax),%ebx
	
	// Return blank-padded name.
	if(strlen(p) >= DIRSIZ)
 22f:	83 ec 0c             	sub    $0xc,%esp
 232:	53                   	push   %ebx
 233:	e8 e8 02 00 00       	call   520 <strlen>
 238:	83 c4 10             	add    $0x10,%esp
 23b:	83 f8 0d             	cmp    $0xd,%eax
 23e:	77 4a                	ja     28a <fmtname+0x8a>
		return p;
	memmove(buf, p, strlen(p));
 240:	83 ec 0c             	sub    $0xc,%esp
 243:	53                   	push   %ebx
 244:	e8 d7 02 00 00       	call   520 <strlen>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	50                   	push   %eax
 24d:	53                   	push   %ebx
 24e:	68 20 10 00 00       	push   $0x1020
 253:	e8 58 04 00 00       	call   6b0 <memmove>
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 258:	89 1c 24             	mov    %ebx,(%esp)
 25b:	e8 c0 02 00 00       	call   520 <strlen>
 260:	89 1c 24             	mov    %ebx,(%esp)
 263:	89 c6                	mov    %eax,%esi
	return buf;
 265:	bb 20 10 00 00       	mov    $0x1020,%ebx
	
	// Return blank-padded name.
	if(strlen(p) >= DIRSIZ)
		return p;
	memmove(buf, p, strlen(p));
	memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 26a:	e8 b1 02 00 00       	call   520 <strlen>
 26f:	ba 0e 00 00 00       	mov    $0xe,%edx
 274:	83 c4 0c             	add    $0xc,%esp
 277:	05 20 10 00 00       	add    $0x1020,%eax
 27c:	29 f2                	sub    %esi,%edx
 27e:	52                   	push   %edx
 27f:	6a 20                	push   $0x20
 281:	50                   	push   %eax
 282:	e8 c9 02 00 00       	call   550 <memset>
	return buf;
 287:	83 c4 10             	add    $0x10,%esp
}
 28a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28d:	89 d8                	mov    %ebx,%eax
 28f:	5b                   	pop    %ebx
 290:	5e                   	pop    %esi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <ls>:

void ls(char *path)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
 2a5:	53                   	push   %ebx
 2a6:	81 ec 54 02 00 00    	sub    $0x254,%esp
 2ac:	8b 7d 08             	mov    0x8(%ebp),%edi
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
 2af:	6a 00                	push   $0x0
 2b1:	57                   	push   %edi
 2b2:	e8 6b 04 00 00       	call   722 <open>
 2b7:	83 c4 10             	add    $0x10,%esp
 2ba:	85 c0                	test   %eax,%eax
 2bc:	0f 88 66 01 00 00    	js     428 <ls+0x188>
	{
		printf(2, "cannot open %s\n", path);
		return;
	}
	
	if(fstat(fd, &st) < 0)
 2c2:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 2c8:	83 ec 08             	sub    $0x8,%esp
 2cb:	89 c3                	mov    %eax,%ebx
 2cd:	56                   	push   %esi
 2ce:	50                   	push   %eax
 2cf:	e8 66 04 00 00       	call   73a <fstat>
 2d4:	83 c4 10             	add    $0x10,%esp
 2d7:	85 c0                	test   %eax,%eax
 2d9:	0f 88 81 01 00 00    	js     460 <ls+0x1c0>
		printf(2, "cannot stat %s\n", path);
		close(fd);
		return;
	}
	
	switch(st.type)
 2df:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 2e6:	66 83 f8 01          	cmp    $0x1,%ax
 2ea:	74 44                	je     330 <ls+0x90>
 2ec:	66 83 f8 02          	cmp    $0x2,%ax
 2f0:	75 20                	jne    312 <ls+0x72>
	{
		case T_FILE:
		printf(1, "name = %s, type = file, size = %d\n", fmtname(path), st.size);
 2f2:	83 ec 0c             	sub    $0xc,%esp
 2f5:	8b b5 e4 fd ff ff    	mov    -0x21c(%ebp),%esi
 2fb:	57                   	push   %edi
 2fc:	e8 ff fe ff ff       	call   200 <fmtname>
 301:	56                   	push   %esi
 302:	50                   	push   %eax
 303:	68 cc 0b 00 00       	push   $0xbcc
 308:	6a 01                	push   $0x1
 30a:	e8 21 05 00 00       	call   830 <printf>
		break;
 30f:	83 c4 20             	add    $0x20,%esp
			}
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
		}
		break;
	}
	close(fd);
 312:	83 ec 0c             	sub    $0xc,%esp
 315:	53                   	push   %ebx
 316:	e8 ef 03 00 00       	call   70a <close>
 31b:	83 c4 10             	add    $0x10,%esp
}
 31e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 321:	5b                   	pop    %ebx
 322:	5e                   	pop    %esi
 323:	5f                   	pop    %edi
 324:	5d                   	pop    %ebp
 325:	c3                   	ret    
 326:	8d 76 00             	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		case T_FILE:
		printf(1, "name = %s, type = file, size = %d\n", fmtname(path), st.size);
		break;
		
		case T_DIR:
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
 330:	83 ec 0c             	sub    $0xc,%esp
 333:	57                   	push   %edi
 334:	e8 e7 01 00 00       	call   520 <strlen>
 339:	83 c0 10             	add    $0x10,%eax
 33c:	83 c4 10             	add    $0x10,%esp
 33f:	3d 00 02 00 00       	cmp    $0x200,%eax
 344:	0f 87 fe 00 00 00    	ja     448 <ls+0x1a8>
		{
			printf(1, "path too long\n");
			break;
		}
		strcpy(buf, path);
 34a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 350:	83 ec 08             	sub    $0x8,%esp
 353:	57                   	push   %edi
 354:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
 35a:	50                   	push   %eax
 35b:	e8 40 01 00 00       	call   4a0 <strcpy>
		p = buf+strlen(buf);
 360:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 366:	89 04 24             	mov    %eax,(%esp)
 369:	e8 b2 01 00 00       	call   520 <strlen>
 36e:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
		*p++ = '/';
		
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 374:	83 c4 10             	add    $0x10,%esp
		{
			printf(1, "path too long\n");
			break;
		}
		strcpy(buf, path);
		p = buf+strlen(buf);
 377:	01 c1                	add    %eax,%ecx
		*p++ = '/';
 379:	8d 84 05 e9 fd ff ff 	lea    -0x217(%ebp,%eax,1),%eax
		{
			printf(1, "path too long\n");
			break;
		}
		strcpy(buf, path);
		p = buf+strlen(buf);
 380:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
		*p++ = '/';
 386:	c6 01 2f             	movb   $0x2f,(%ecx)
 389:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 38f:	90                   	nop
		
		while(read(fd, &de, sizeof(de)) == sizeof(de))
 390:	83 ec 04             	sub    $0x4,%esp
 393:	6a 10                	push   $0x10
 395:	57                   	push   %edi
 396:	53                   	push   %ebx
 397:	e8 5e 03 00 00       	call   6fa <read>
 39c:	83 c4 10             	add    $0x10,%esp
 39f:	83 f8 10             	cmp    $0x10,%eax
 3a2:	0f 85 6a ff ff ff    	jne    312 <ls+0x72>
		{
			if(de.inum == 0)
 3a8:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 3af:	00 
 3b0:	74 de                	je     390 <ls+0xf0>
				continue;
			memmove(p, de.name, DIRSIZ);
 3b2:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 3b8:	83 ec 04             	sub    $0x4,%esp
 3bb:	6a 0e                	push   $0xe
 3bd:	50                   	push   %eax
 3be:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
 3c4:	e8 e7 02 00 00       	call   6b0 <memmove>
			p[DIRSIZ] = 0;
 3c9:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
 3cf:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
			if(stat(buf, &st) < 0)
 3d3:	58                   	pop    %eax
 3d4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 3da:	5a                   	pop    %edx
 3db:	56                   	push   %esi
 3dc:	50                   	push   %eax
 3dd:	e8 3e 02 00 00       	call   620 <stat>
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	85 c0                	test   %eax,%eax
 3e7:	0f 88 93 00 00 00    	js     480 <ls+0x1e0>
			{
				printf(1, "cannot stat %s\n", buf);
				continue;
			}
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
 3ed:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 3f3:	83 ec 0c             	sub    $0xc,%esp
 3f6:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 3fc:	50                   	push   %eax
 3fd:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 403:	e8 f8 fd ff ff       	call   200 <fmtname>
 408:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 40e:	52                   	push   %edx
 40f:	50                   	push   %eax
 410:	68 f0 0b 00 00       	push   $0xbf0
 415:	6a 01                	push   $0x1
 417:	e8 14 04 00 00       	call   830 <printf>
 41c:	83 c4 20             	add    $0x20,%esp
 41f:	e9 6c ff ff ff       	jmp    390 <ls+0xf0>
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	struct dirent de;
	struct stat st;
	
	if((fd = open(path, 0)) < 0)
	{
		printf(2, "cannot open %s\n", path);
 428:	83 ec 04             	sub    $0x4,%esp
 42b:	57                   	push   %edi
 42c:	68 50 0b 00 00       	push   $0xb50
 431:	6a 02                	push   $0x2
 433:	e8 f8 03 00 00       	call   830 <printf>
		return;
 438:	83 c4 10             	add    $0x10,%esp
			printf(1, "name = %s, type = directory, size = %d\n", fmtname(buf), st.size);
		}
		break;
	}
	close(fd);
}
 43b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5f                   	pop    %edi
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    
 443:	90                   	nop
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		break;
		
		case T_DIR:
		if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
		{
			printf(1, "path too long\n");
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	68 70 0b 00 00       	push   $0xb70
 450:	6a 01                	push   $0x1
 452:	e8 d9 03 00 00       	call   830 <printf>
			break;
 457:	83 c4 10             	add    $0x10,%esp
 45a:	e9 b3 fe ff ff       	jmp    312 <ls+0x72>
 45f:	90                   	nop
		return;
	}
	
	if(fstat(fd, &st) < 0)
	{
		printf(2, "cannot stat %s\n", path);
 460:	83 ec 04             	sub    $0x4,%esp
 463:	57                   	push   %edi
 464:	68 60 0b 00 00       	push   $0xb60
 469:	6a 02                	push   $0x2
 46b:	e8 c0 03 00 00       	call   830 <printf>
		close(fd);
 470:	89 1c 24             	mov    %ebx,(%esp)
 473:	e8 92 02 00 00       	call   70a <close>
		return;
 478:	83 c4 10             	add    $0x10,%esp
 47b:	e9 9e fe ff ff       	jmp    31e <ls+0x7e>
				continue;
			memmove(p, de.name, DIRSIZ);
			p[DIRSIZ] = 0;
			if(stat(buf, &st) < 0)
			{
				printf(1, "cannot stat %s\n", buf);
 480:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 486:	83 ec 04             	sub    $0x4,%esp
 489:	50                   	push   %eax
 48a:	68 60 0b 00 00       	push   $0xb60
 48f:	6a 01                	push   $0x1
 491:	e8 9a 03 00 00       	call   830 <printf>
				continue;
 496:	83 c4 10             	add    $0x10,%esp
 499:	e9 f2 fe ff ff       	jmp    390 <ls+0xf0>
 49e:	66 90                	xchg   %ax,%ax

000004a0 <strcpy>:
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4aa:	89 c2                	mov    %eax,%edx
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b0:	83 c1 01             	add    $0x1,%ecx
 4b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 4b7:	83 c2 01             	add    $0x1,%edx
 4ba:	84 db                	test   %bl,%bl
 4bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 4bf:	75 ef                	jne    4b0 <strcpy+0x10>
 4c1:	5b                   	pop    %ebx
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000004d0 <strcmp>:
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
 4d5:	8b 55 08             	mov    0x8(%ebp),%edx
 4d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4db:	0f b6 02             	movzbl (%edx),%eax
 4de:	0f b6 19             	movzbl (%ecx),%ebx
 4e1:	84 c0                	test   %al,%al
 4e3:	75 1e                	jne    503 <strcmp+0x33>
 4e5:	eb 29                	jmp    510 <strcmp+0x40>
 4e7:	89 f6                	mov    %esi,%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 4f0:	83 c2 01             	add    $0x1,%edx
 4f3:	0f b6 02             	movzbl (%edx),%eax
 4f6:	8d 71 01             	lea    0x1(%ecx),%esi
 4f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 4fd:	84 c0                	test   %al,%al
 4ff:	74 0f                	je     510 <strcmp+0x40>
 501:	89 f1                	mov    %esi,%ecx
 503:	38 d8                	cmp    %bl,%al
 505:	74 e9                	je     4f0 <strcmp+0x20>
 507:	29 d8                	sub    %ebx,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	31 c0                	xor    %eax,%eax
 512:	29 d8                	sub    %ebx,%eax
 514:	5b                   	pop    %ebx
 515:	5e                   	pop    %esi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000520 <strlen>:
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	8b 4d 08             	mov    0x8(%ebp),%ecx
 526:	80 39 00             	cmpb   $0x0,(%ecx)
 529:	74 12                	je     53d <strlen+0x1d>
 52b:	31 d2                	xor    %edx,%edx
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	83 c2 01             	add    $0x1,%edx
 533:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 537:	89 d0                	mov    %edx,%eax
 539:	75 f5                	jne    530 <strlen+0x10>
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	31 c0                	xor    %eax,%eax
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    
 541:	eb 0d                	jmp    550 <memset>
 543:	90                   	nop
 544:	90                   	nop
 545:	90                   	nop
 546:	90                   	nop
 547:	90                   	nop
 548:	90                   	nop
 549:	90                   	nop
 54a:	90                   	nop
 54b:	90                   	nop
 54c:	90                   	nop
 54d:	90                   	nop
 54e:	90                   	nop
 54f:	90                   	nop

00000550 <memset>:
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	8b 55 08             	mov    0x8(%ebp),%edx
 557:	8b 4d 10             	mov    0x10(%ebp),%ecx
 55a:	8b 45 0c             	mov    0xc(%ebp),%eax
 55d:	89 d7                	mov    %edx,%edi
 55f:	fc                   	cld    
 560:	f3 aa                	rep stos %al,%es:(%edi)
 562:	89 d0                	mov    %edx,%eax
 564:	5f                   	pop    %edi
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    
 567:	89 f6                	mov    %esi,%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000570 <strchr>:
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	53                   	push   %ebx
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 57a:	0f b6 10             	movzbl (%eax),%edx
 57d:	84 d2                	test   %dl,%dl
 57f:	74 1d                	je     59e <strchr+0x2e>
 581:	38 d3                	cmp    %dl,%bl
 583:	89 d9                	mov    %ebx,%ecx
 585:	75 0d                	jne    594 <strchr+0x24>
 587:	eb 17                	jmp    5a0 <strchr+0x30>
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 590:	38 ca                	cmp    %cl,%dl
 592:	74 0c                	je     5a0 <strchr+0x30>
 594:	83 c0 01             	add    $0x1,%eax
 597:	0f b6 10             	movzbl (%eax),%edx
 59a:	84 d2                	test   %dl,%dl
 59c:	75 f2                	jne    590 <strchr+0x20>
 59e:	31 c0                	xor    %eax,%eax
 5a0:	5b                   	pop    %ebx
 5a1:	5d                   	pop    %ebp
 5a2:	c3                   	ret    
 5a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005b0 <gets>:
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	31 f6                	xor    %esi,%esi
 5b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5bb:	83 ec 1c             	sub    $0x1c,%esp
 5be:	eb 29                	jmp    5e9 <gets+0x39>
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	6a 01                	push   $0x1
 5c5:	57                   	push   %edi
 5c6:	6a 00                	push   $0x0
 5c8:	e8 2d 01 00 00       	call   6fa <read>
 5cd:	83 c4 10             	add    $0x10,%esp
 5d0:	85 c0                	test   %eax,%eax
 5d2:	7e 1d                	jle    5f1 <gets+0x41>
 5d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5d8:	8b 55 08             	mov    0x8(%ebp),%edx
 5db:	89 de                	mov    %ebx,%esi
 5dd:	3c 0a                	cmp    $0xa,%al
 5df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 5e3:	74 1b                	je     600 <gets+0x50>
 5e5:	3c 0d                	cmp    $0xd,%al
 5e7:	74 17                	je     600 <gets+0x50>
 5e9:	8d 5e 01             	lea    0x1(%esi),%ebx
 5ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5ef:	7c cf                	jl     5c0 <gets+0x10>
 5f1:	8b 45 08             	mov    0x8(%ebp),%eax
 5f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 5f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	89 de                	mov    %ebx,%esi
 605:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 609:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60c:	5b                   	pop    %ebx
 60d:	5e                   	pop    %esi
 60e:	5f                   	pop    %edi
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret    
 611:	eb 0d                	jmp    620 <stat>
 613:	90                   	nop
 614:	90                   	nop
 615:	90                   	nop
 616:	90                   	nop
 617:	90                   	nop
 618:	90                   	nop
 619:	90                   	nop
 61a:	90                   	nop
 61b:	90                   	nop
 61c:	90                   	nop
 61d:	90                   	nop
 61e:	90                   	nop
 61f:	90                   	nop

00000620 <stat>:
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	56                   	push   %esi
 624:	53                   	push   %ebx
 625:	83 ec 08             	sub    $0x8,%esp
 628:	6a 00                	push   $0x0
 62a:	ff 75 08             	pushl  0x8(%ebp)
 62d:	e8 f0 00 00 00       	call   722 <open>
 632:	83 c4 10             	add    $0x10,%esp
 635:	85 c0                	test   %eax,%eax
 637:	78 27                	js     660 <stat+0x40>
 639:	83 ec 08             	sub    $0x8,%esp
 63c:	ff 75 0c             	pushl  0xc(%ebp)
 63f:	89 c3                	mov    %eax,%ebx
 641:	50                   	push   %eax
 642:	e8 f3 00 00 00       	call   73a <fstat>
 647:	89 c6                	mov    %eax,%esi
 649:	89 1c 24             	mov    %ebx,(%esp)
 64c:	e8 b9 00 00 00       	call   70a <close>
 651:	83 c4 10             	add    $0x10,%esp
 654:	89 f0                	mov    %esi,%eax
 656:	8d 65 f8             	lea    -0x8(%ebp),%esp
 659:	5b                   	pop    %ebx
 65a:	5e                   	pop    %esi
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret    
 65d:	8d 76 00             	lea    0x0(%esi),%esi
 660:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 665:	eb ef                	jmp    656 <stat+0x36>
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <atoi>:
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	53                   	push   %ebx
 674:	8b 4d 08             	mov    0x8(%ebp),%ecx
 677:	0f be 11             	movsbl (%ecx),%edx
 67a:	8d 42 d0             	lea    -0x30(%edx),%eax
 67d:	3c 09                	cmp    $0x9,%al
 67f:	b8 00 00 00 00       	mov    $0x0,%eax
 684:	77 1f                	ja     6a5 <atoi+0x35>
 686:	8d 76 00             	lea    0x0(%esi),%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 690:	8d 04 80             	lea    (%eax,%eax,4),%eax
 693:	83 c1 01             	add    $0x1,%ecx
 696:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 69a:	0f be 11             	movsbl (%ecx),%edx
 69d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 6a0:	80 fb 09             	cmp    $0x9,%bl
 6a3:	76 eb                	jbe    690 <atoi+0x20>
 6a5:	5b                   	pop    %ebx
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	90                   	nop
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006b0 <memmove>:
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	56                   	push   %esi
 6b4:	53                   	push   %ebx
 6b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	8b 75 0c             	mov    0xc(%ebp),%esi
 6be:	85 db                	test   %ebx,%ebx
 6c0:	7e 14                	jle    6d6 <memmove+0x26>
 6c2:	31 d2                	xor    %edx,%edx
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 6cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 6cf:	83 c2 01             	add    $0x1,%edx
 6d2:	39 da                	cmp    %ebx,%edx
 6d4:	75 f2                	jne    6c8 <memmove+0x18>
 6d6:	5b                   	pop    %ebx
 6d7:	5e                   	pop    %esi
 6d8:	5d                   	pop    %ebp
 6d9:	c3                   	ret    

000006da <fork>:
 6da:	b8 01 00 00 00       	mov    $0x1,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <exit>:
 6e2:	b8 02 00 00 00       	mov    $0x2,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <wait>:
 6ea:	b8 03 00 00 00       	mov    $0x3,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <pipe>:
 6f2:	b8 04 00 00 00       	mov    $0x4,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <read>:
 6fa:	b8 05 00 00 00       	mov    $0x5,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <write>:
 702:	b8 10 00 00 00       	mov    $0x10,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <close>:
 70a:	b8 15 00 00 00       	mov    $0x15,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <kill>:
 712:	b8 06 00 00 00       	mov    $0x6,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <exec>:
 71a:	b8 07 00 00 00       	mov    $0x7,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <open>:
 722:	b8 0f 00 00 00       	mov    $0xf,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <mknod>:
 72a:	b8 11 00 00 00       	mov    $0x11,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <unlink>:
 732:	b8 12 00 00 00       	mov    $0x12,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <fstat>:
 73a:	b8 08 00 00 00       	mov    $0x8,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <link>:
 742:	b8 13 00 00 00       	mov    $0x13,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <mkdir>:
 74a:	b8 14 00 00 00       	mov    $0x14,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <chdir>:
 752:	b8 09 00 00 00       	mov    $0x9,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <dup>:
 75a:	b8 0a 00 00 00       	mov    $0xa,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <getpid>:
 762:	b8 0b 00 00 00       	mov    $0xb,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <sbrk>:
 76a:	b8 0c 00 00 00       	mov    $0xc,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <sleep>:
 772:	b8 0d 00 00 00       	mov    $0xd,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <uptime>:
 77a:	b8 0e 00 00 00       	mov    $0xe,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <mkfile>:
 782:	b8 16 00 00 00       	mov    $0x16,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    
 78a:	66 90                	xchg   %ax,%ax
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax

00000790 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	89 c6                	mov    %eax,%esi
 798:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 79e:	85 db                	test   %ebx,%ebx
 7a0:	74 7e                	je     820 <printint+0x90>
 7a2:	89 d0                	mov    %edx,%eax
 7a4:	c1 e8 1f             	shr    $0x1f,%eax
 7a7:	84 c0                	test   %al,%al
 7a9:	74 75                	je     820 <printint+0x90>
    neg = 1;
    x = -xx;
 7ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 7b4:	f7 d8                	neg    %eax
 7b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7b9:	31 ff                	xor    %edi,%edi
 7bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 7be:	89 ce                	mov    %ecx,%esi
 7c0:	eb 08                	jmp    7ca <printint+0x3a>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7c8:	89 cf                	mov    %ecx,%edi
 7ca:	31 d2                	xor    %edx,%edx
 7cc:	8d 4f 01             	lea    0x1(%edi),%ecx
 7cf:	f7 f6                	div    %esi
 7d1:	0f b6 92 14 0d 00 00 	movzbl 0xd14(%edx),%edx
  }while((x /= base) != 0);
 7d8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 7da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 7dd:	75 e9                	jne    7c8 <printint+0x38>
  if(neg)
 7df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 7e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 7e5:	85 c0                	test   %eax,%eax
 7e7:	74 08                	je     7f1 <printint+0x61>
    buf[i++] = '-';
 7e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 7ee:	8d 4f 02             	lea    0x2(%edi),%ecx
 7f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 7f5:	8d 76 00             	lea    0x0(%esi),%esi
 7f8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7fb:	83 ec 04             	sub    $0x4,%esp
 7fe:	83 ef 01             	sub    $0x1,%edi
 801:	6a 01                	push   $0x1
 803:	53                   	push   %ebx
 804:	56                   	push   %esi
 805:	88 45 d7             	mov    %al,-0x29(%ebp)
 808:	e8 f5 fe ff ff       	call   702 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 80d:	83 c4 10             	add    $0x10,%esp
 810:	39 df                	cmp    %ebx,%edi
 812:	75 e4                	jne    7f8 <printint+0x68>
    putc(fd, buf[i]);
}
 814:	8d 65 f4             	lea    -0xc(%ebp),%esp
 817:	5b                   	pop    %ebx
 818:	5e                   	pop    %esi
 819:	5f                   	pop    %edi
 81a:	5d                   	pop    %ebp
 81b:	c3                   	ret    
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 820:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 822:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 829:	eb 8b                	jmp    7b6 <printint+0x26>
 82b:	90                   	nop
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000830 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 836:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 839:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 83c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 83f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 842:	89 45 d0             	mov    %eax,-0x30(%ebp)
 845:	0f b6 1e             	movzbl (%esi),%ebx
 848:	83 c6 01             	add    $0x1,%esi
 84b:	84 db                	test   %bl,%bl
 84d:	0f 84 b0 00 00 00    	je     903 <printf+0xd3>
 853:	31 d2                	xor    %edx,%edx
 855:	eb 39                	jmp    890 <printf+0x60>
 857:	89 f6                	mov    %esi,%esi
 859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 860:	83 f8 25             	cmp    $0x25,%eax
 863:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 866:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 86b:	74 18                	je     885 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 86d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 870:	83 ec 04             	sub    $0x4,%esp
 873:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 876:	6a 01                	push   $0x1
 878:	50                   	push   %eax
 879:	57                   	push   %edi
 87a:	e8 83 fe ff ff       	call   702 <write>
 87f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 882:	83 c4 10             	add    $0x10,%esp
 885:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 888:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 88c:	84 db                	test   %bl,%bl
 88e:	74 73                	je     903 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 890:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 892:	0f be cb             	movsbl %bl,%ecx
 895:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 898:	74 c6                	je     860 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 89a:	83 fa 25             	cmp    $0x25,%edx
 89d:	75 e6                	jne    885 <printf+0x55>
      if(c == 'd'){
 89f:	83 f8 64             	cmp    $0x64,%eax
 8a2:	0f 84 f8 00 00 00    	je     9a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8a8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 8ae:	83 f9 70             	cmp    $0x70,%ecx
 8b1:	74 5d                	je     910 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8b3:	83 f8 73             	cmp    $0x73,%eax
 8b6:	0f 84 84 00 00 00    	je     940 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8bc:	83 f8 63             	cmp    $0x63,%eax
 8bf:	0f 84 ea 00 00 00    	je     9af <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8c5:	83 f8 25             	cmp    $0x25,%eax
 8c8:	0f 84 c2 00 00 00    	je     990 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8d1:	83 ec 04             	sub    $0x4,%esp
 8d4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8d8:	6a 01                	push   $0x1
 8da:	50                   	push   %eax
 8db:	57                   	push   %edi
 8dc:	e8 21 fe ff ff       	call   702 <write>
 8e1:	83 c4 0c             	add    $0xc,%esp
 8e4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 8e7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 8ea:	6a 01                	push   $0x1
 8ec:	50                   	push   %eax
 8ed:	57                   	push   %edi
 8ee:	83 c6 01             	add    $0x1,%esi
 8f1:	e8 0c fe ff ff       	call   702 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8fd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ff:	84 db                	test   %bl,%bl
 901:	75 8d                	jne    890 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 903:	8d 65 f4             	lea    -0xc(%ebp),%esp
 906:	5b                   	pop    %ebx
 907:	5e                   	pop    %esi
 908:	5f                   	pop    %edi
 909:	5d                   	pop    %ebp
 90a:	c3                   	ret    
 90b:	90                   	nop
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	b9 10 00 00 00       	mov    $0x10,%ecx
 918:	6a 00                	push   $0x0
 91a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 91d:	89 f8                	mov    %edi,%eax
 91f:	8b 13                	mov    (%ebx),%edx
 921:	e8 6a fe ff ff       	call   790 <printint>
        ap++;
 926:	89 d8                	mov    %ebx,%eax
 928:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 92b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 92d:	83 c0 04             	add    $0x4,%eax
 930:	89 45 d0             	mov    %eax,-0x30(%ebp)
 933:	e9 4d ff ff ff       	jmp    885 <printf+0x55>
 938:	90                   	nop
 939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 940:	8b 45 d0             	mov    -0x30(%ebp),%eax
 943:	8b 18                	mov    (%eax),%ebx
        ap++;
 945:	83 c0 04             	add    $0x4,%eax
 948:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 94b:	b8 0c 0d 00 00       	mov    $0xd0c,%eax
 950:	85 db                	test   %ebx,%ebx
 952:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 955:	0f b6 03             	movzbl (%ebx),%eax
 958:	84 c0                	test   %al,%al
 95a:	74 23                	je     97f <printf+0x14f>
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 960:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 963:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 966:	83 ec 04             	sub    $0x4,%esp
 969:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 96b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 96e:	50                   	push   %eax
 96f:	57                   	push   %edi
 970:	e8 8d fd ff ff       	call   702 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 975:	0f b6 03             	movzbl (%ebx),%eax
 978:	83 c4 10             	add    $0x10,%esp
 97b:	84 c0                	test   %al,%al
 97d:	75 e1                	jne    960 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 97f:	31 d2                	xor    %edx,%edx
 981:	e9 ff fe ff ff       	jmp    885 <printf+0x55>
 986:	8d 76 00             	lea    0x0(%esi),%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 990:	83 ec 04             	sub    $0x4,%esp
 993:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 996:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 999:	6a 01                	push   $0x1
 99b:	e9 4c ff ff ff       	jmp    8ec <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9a0:	83 ec 0c             	sub    $0xc,%esp
 9a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9a8:	6a 01                	push   $0x1
 9aa:	e9 6b ff ff ff       	jmp    91a <printf+0xea>
 9af:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b2:	83 ec 04             	sub    $0x4,%esp
 9b5:	8b 03                	mov    (%ebx),%eax
 9b7:	6a 01                	push   $0x1
 9b9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 9bc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 9bf:	50                   	push   %eax
 9c0:	57                   	push   %edi
 9c1:	e8 3c fd ff ff       	call   702 <write>
 9c6:	e9 5b ff ff ff       	jmp    926 <printf+0xf6>
 9cb:	66 90                	xchg   %ax,%ax
 9cd:	66 90                	xchg   %ax,%ax
 9cf:	90                   	nop

000009d0 <free>:
 9d0:	55                   	push   %ebp
 9d1:	a1 30 10 00 00       	mov    0x1030,%eax
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	57                   	push   %edi
 9d9:	56                   	push   %esi
 9da:	53                   	push   %ebx
 9db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9de:	8b 10                	mov    (%eax),%edx
 9e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 9e3:	39 c8                	cmp    %ecx,%eax
 9e5:	73 19                	jae    a00 <free+0x30>
 9e7:	89 f6                	mov    %esi,%esi
 9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 9f0:	39 d1                	cmp    %edx,%ecx
 9f2:	72 1c                	jb     a10 <free+0x40>
 9f4:	39 d0                	cmp    %edx,%eax
 9f6:	73 18                	jae    a10 <free+0x40>
 9f8:	89 d0                	mov    %edx,%eax
 9fa:	39 c8                	cmp    %ecx,%eax
 9fc:	8b 10                	mov    (%eax),%edx
 9fe:	72 f0                	jb     9f0 <free+0x20>
 a00:	39 d0                	cmp    %edx,%eax
 a02:	72 f4                	jb     9f8 <free+0x28>
 a04:	39 d1                	cmp    %edx,%ecx
 a06:	73 f0                	jae    9f8 <free+0x28>
 a08:	90                   	nop
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a10:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a13:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a16:	39 d7                	cmp    %edx,%edi
 a18:	74 19                	je     a33 <free+0x63>
 a1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a1d:	8b 50 04             	mov    0x4(%eax),%edx
 a20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a23:	39 f1                	cmp    %esi,%ecx
 a25:	74 23                	je     a4a <free+0x7a>
 a27:	89 08                	mov    %ecx,(%eax)
 a29:	a3 30 10 00 00       	mov    %eax,0x1030
 a2e:	5b                   	pop    %ebx
 a2f:	5e                   	pop    %esi
 a30:	5f                   	pop    %edi
 a31:	5d                   	pop    %ebp
 a32:	c3                   	ret    
 a33:	03 72 04             	add    0x4(%edx),%esi
 a36:	89 73 fc             	mov    %esi,-0x4(%ebx)
 a39:	8b 10                	mov    (%eax),%edx
 a3b:	8b 12                	mov    (%edx),%edx
 a3d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a40:	8b 50 04             	mov    0x4(%eax),%edx
 a43:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a46:	39 f1                	cmp    %esi,%ecx
 a48:	75 dd                	jne    a27 <free+0x57>
 a4a:	03 53 fc             	add    -0x4(%ebx),%edx
 a4d:	a3 30 10 00 00       	mov    %eax,0x1030
 a52:	89 50 04             	mov    %edx,0x4(%eax)
 a55:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a58:	89 10                	mov    %edx,(%eax)
 a5a:	5b                   	pop    %ebx
 a5b:	5e                   	pop    %esi
 a5c:	5f                   	pop    %edi
 a5d:	5d                   	pop    %ebp
 a5e:	c3                   	ret    
 a5f:	90                   	nop

00000a60 <malloc>:
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	57                   	push   %edi
 a64:	56                   	push   %esi
 a65:	53                   	push   %ebx
 a66:	83 ec 0c             	sub    $0xc,%esp
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
 a6c:	8b 15 30 10 00 00    	mov    0x1030,%edx
 a72:	8d 78 07             	lea    0x7(%eax),%edi
 a75:	c1 ef 03             	shr    $0x3,%edi
 a78:	83 c7 01             	add    $0x1,%edi
 a7b:	85 d2                	test   %edx,%edx
 a7d:	0f 84 a3 00 00 00    	je     b26 <malloc+0xc6>
 a83:	8b 02                	mov    (%edx),%eax
 a85:	8b 48 04             	mov    0x4(%eax),%ecx
 a88:	39 cf                	cmp    %ecx,%edi
 a8a:	76 74                	jbe    b00 <malloc+0xa0>
 a8c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a92:	be 00 10 00 00       	mov    $0x1000,%esi
 a97:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 a9e:	0f 43 f7             	cmovae %edi,%esi
 aa1:	ba 00 80 00 00       	mov    $0x8000,%edx
 aa6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 aac:	0f 46 da             	cmovbe %edx,%ebx
 aaf:	eb 10                	jmp    ac1 <malloc+0x61>
 ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ab8:	8b 02                	mov    (%edx),%eax
 aba:	8b 48 04             	mov    0x4(%eax),%ecx
 abd:	39 cf                	cmp    %ecx,%edi
 abf:	76 3f                	jbe    b00 <malloc+0xa0>
 ac1:	39 05 30 10 00 00    	cmp    %eax,0x1030
 ac7:	89 c2                	mov    %eax,%edx
 ac9:	75 ed                	jne    ab8 <malloc+0x58>
 acb:	83 ec 0c             	sub    $0xc,%esp
 ace:	53                   	push   %ebx
 acf:	e8 96 fc ff ff       	call   76a <sbrk>
 ad4:	83 c4 10             	add    $0x10,%esp
 ad7:	83 f8 ff             	cmp    $0xffffffff,%eax
 ada:	74 1c                	je     af8 <malloc+0x98>
 adc:	89 70 04             	mov    %esi,0x4(%eax)
 adf:	83 ec 0c             	sub    $0xc,%esp
 ae2:	83 c0 08             	add    $0x8,%eax
 ae5:	50                   	push   %eax
 ae6:	e8 e5 fe ff ff       	call   9d0 <free>
 aeb:	8b 15 30 10 00 00    	mov    0x1030,%edx
 af1:	83 c4 10             	add    $0x10,%esp
 af4:	85 d2                	test   %edx,%edx
 af6:	75 c0                	jne    ab8 <malloc+0x58>
 af8:	31 c0                	xor    %eax,%eax
 afa:	eb 1c                	jmp    b18 <malloc+0xb8>
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b00:	39 cf                	cmp    %ecx,%edi
 b02:	74 1c                	je     b20 <malloc+0xc0>
 b04:	29 f9                	sub    %edi,%ecx
 b06:	89 48 04             	mov    %ecx,0x4(%eax)
 b09:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 b0c:	89 78 04             	mov    %edi,0x4(%eax)
 b0f:	89 15 30 10 00 00    	mov    %edx,0x1030
 b15:	83 c0 08             	add    $0x8,%eax
 b18:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b1b:	5b                   	pop    %ebx
 b1c:	5e                   	pop    %esi
 b1d:	5f                   	pop    %edi
 b1e:	5d                   	pop    %ebp
 b1f:	c3                   	ret    
 b20:	8b 08                	mov    (%eax),%ecx
 b22:	89 0a                	mov    %ecx,(%edx)
 b24:	eb e9                	jmp    b0f <malloc+0xaf>
 b26:	c7 05 30 10 00 00 34 	movl   $0x1034,0x1030
 b2d:	10 00 00 
 b30:	c7 05 34 10 00 00 34 	movl   $0x1034,0x1034
 b37:	10 00 00 
 b3a:	b8 34 10 00 00       	mov    $0x1034,%eax
 b3f:	c7 05 38 10 00 00 00 	movl   $0x0,0x1038
 b46:	00 00 00 
 b49:	e9 3e ff ff ff       	jmp    a8c <malloc+0x2c>
