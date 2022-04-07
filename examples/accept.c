#include <stdio.h>
#include <stdlib.h>

#include "accept.leg.c"

int main()
{
  while (yyparse());

  return 0;
}
