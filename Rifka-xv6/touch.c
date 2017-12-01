#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
  int i;
  if(argc < 2){
    printf(2, "Minimal 2 argumen\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkfile(argv[i]) < 0){
      printf(2, "touch: %s gagal dibuat\n", argv[i]);
      break;}
      }

  exit();
}
