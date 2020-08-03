#include "../../incs/minishell.h"

int try_path(char *s)
{
	struct stat buff;

	errno = 0;
	stat(s, &buff);
	if (errno)
		return (-1);
	return (0);
}

char	*find_correct_path(char	*s, char *arg)
{
	int i;
	int j;
	int l;
	char *test;
	char *dup;

	i = 0;
	j = 0;
	if (!ft_strchr(s, ':'))
		return (NULL);
	while (s[i])
	{
		if (s[i] == ':' || s[i + 1] == '\0')
		{
			if (s[i + 1] == '\0')
				i++;
			l = i - 1;
			if ((test = ft_strldup(s, j, l)) == NULL)
			{
				free (test);
			    return (NULL);
			}
			if ((dup = ft_strjoin(test, arg)) == NULL)
			{
				free (test);
				free (dup);
			    return (NULL);
			}
			free (test);
			if (try_path(dup) == 0)
				return (dup);
			free (dup);
			j = i + 1;
		}
		i++;
	}
	return (NULL);
}

char	*find_path_env(char **env, char *arg)
{
	int		i;
	int		j;
	char	*s;
	char	*path;

	i = 0;
	while (env[i])
	{
		if (ft_strncmp(env[i], "PATH=", ft_strlen("PATH=")) == 0)
		{
			j = 0;
			while (env[i][j] != '=')
				j++;
			j++;
			s = ft_substr(env[i], j, ft_strlen(env[i]) - j);
			if ((path = find_correct_path(s, arg)) != NULL)
			{
				free (s);
				return (path);
			}
			free (s);
			free (path);
		}
		i++;
	}
	return (NULL);
}