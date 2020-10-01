/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections3.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: celestin <celestin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/14 15:56:23 by rzafari           #+#    #+#             */
/*   Updated: 2020/10/01 22:26:51 by celestin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../incs/minishell.h"

int		check_arg_redir(char **arg)
{
	int		ret;

	if ((ret = arg_cleanup(arg)) < 1)
	{
		if (!ret)
			return (ft_strerror(NULL, NULL, NULL, NULL));
		else
			return (-1);
	}
	return (0);
}

int		check_if_ranglebracket(t_cmd *cmd, int i)
{
	int ret;

	if (ft_strcmp(cmd->arg[i], ">") == 0)
	{
		if ((ret = check_arg_redir(cmd->arg)) == -1)
		{
			ft_error(AMBIGUOUS, NULL, NULL, cmd->arg[i + 1]);
			g_ret = 1;
			return (-1);
		}
		if (r_anglebracket(cmd->arg, cmd, cmd->arg[i + 1], NULL) == -1)
			return (-1);
	}
	return (0);
}

int		check_if_dbanglebracket(t_cmd *cmd, int i)
{
	int ret;

	if (ft_strcmp(cmd->arg[i], ">>") == 0)
	{
		if ((ret = check_arg_redir(cmd->arg)) == -1)
		{
			ft_error(AMBIGUOUS, NULL, NULL, cmd->arg[i + 1]);
			g_ret = 1;
			return (-1);
		}
		if (r_dbanglebracket(cmd->arg, cmd, cmd->arg[i + 1], NULL) == -1)
			return (-1);
	}
	return (0);
}

int		check_if_langlebracket(t_cmd *cmd, int i)
{
	int ret;

	if (ft_strcmp(cmd->arg[i], "<") == 0)
	{
		if ((ret = check_arg_redir(cmd->arg)) == -1)
		{
			ft_error(AMBIGUOUS, NULL, NULL, cmd->arg[i + 1]);
			g_ret = 1;
			return (-1);
		}
		if (l_anglebracket(cmd->arg, cmd, cmd->arg[i + 1], NULL) == -1)
			return (-1);
	}
	return (0);
}
