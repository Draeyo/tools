#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int		main(int ac, char **av)
{
		char	*str = NULL;
		int		i = -1;
		int		maj = 0;
		int		num = 0;
		int		spe = 0;
		int		min = 0;
		int		len = 0;
		int		minsec = 0;

		if (ac < 2)
		{
				len = 8;
				minsec = 2;
		}
		else
		{
				if ((len = atoi(av[1])) < 4)
				{
						printf("WARNING: password length must be > 4\n");
						printf("WARNING: password length automaticaly set to 4\n");
						len = 4;
				}
				if (!(minsec = len / 4))
						minsec = 1;
		}
		if (!(str = (char*)malloc(sizeof(char) * (len + 1))))
		{
				dprintf(2, "\033[31mERROR\033[0m Allocation Error");
				return (0);
		}
		bzero(str, (len + 1));
		i = -1;
		srand(time(NULL));
		while (++i < len)
		{
				while (str[i] < 33 || str[i] > 126)
				{
						str[i] = rand();
						if (str[i] >= 'A' && str[i] <= 'Z')
								++maj;
						else if (str[i] >= 'a' && str[i] <= 'z')
								++min;
						else if (str[i] >= '0' && str[i] <= '9')
								++num;
						else if (str[i] >= 33 && str[i] <= 47)
								++spe;
						else if (str[i] >= 58 && str[i] <= 64)
								++spe;
						else if (str[i] >= 91 && str[i] <= 96)
								++spe;
						else if (str[i] >= 123 && str[i] <= 126)
								++spe;
				}
				if (i == (len - 1) && (spe < minsec || maj < minsec || num < minsec || min < minsec))
				{
						i = -1;
						min = 0;
						maj = 0;
						num = 0;
						spe = 0;
						bzero(str, (len + 1));
				}
		}
		printf("\npassword : %s\n", str);
		printf("\nlength : %d\n", len);
		printf("min. of each type: %d\n", minsec);
		printf("min : %d\n", min);
		printf("maj : %d\n", maj);
		printf("num : %d\n", num);
		printf("spe : %d\n", spe);
		free(str);
		return (0);
}
