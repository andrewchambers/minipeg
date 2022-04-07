#include <stdio.h>
#include <stdlib.h>

#include "rule.leg.c"

int main()
{
  while (yyparse());

  return 0;
}
