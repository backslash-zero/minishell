NAME		=	minishell

HEADER		=	incs/

CC			=	clang

FLAGS		=	-Wall -Wextra -Werror

LEAKS		=	-g3 -fsanitize=address -fsanitize=leak

SRC_PATH	=	src/

SRC_NAME	=	builtins/builtins_nametab.c 				\
				builtins/cd.c 								\
				builtins/echo.c 							\
				builtins/env.c								\
				builtins/exit.c 							\
				builtins/export.c 							\
				builtins/export_2.c 						\
				builtins/export_next.c 						\
				builtins/export_next_2.c 					\
				builtins/pwd.c 								\
				builtins/unset.c							\
				parsing/parsing.c							\
				parsing/append.c							\
				parsing/cleanup/cleanup.c					\
				parsing/cleanup/cleanup_var.c				\
				parsing/cleanup/cleanup_gret.c				\
				parsing/cleanup/cleanup_var_space.c			\
				parsing/cleanup/cleanup_var_space_2.c		\
				parsing/cleanup/cleanup_bs_quote.c			\
				parsing/utils/is_funcs/is_funcs_1.c			\
				parsing/utils/is_funcs/is_funcs_2.c			\
				parsing/utils/is_funcs/is_funcs_3.c			\
				parsing/utils/tools/backslash_tools_1.c		\
				parsing/utils/tools/backslash_tools_2.c		\
				parsing/utils/tools/gret_tools.c			\
				parsing/utils/tools/quote_tools.c			\
				parsing/utils/tools/var_tools_1.c			\
				parsing/utils/tools/var_tools_2.c			\
				parsing/utils/tools/redir_pipe_tools.c		\
				parsing/utils/tools/semicolon_tools.c		\
				parsing/utils/parsing_utils_1.c				\
				pipe/pipe.c									\
				pipe/pipe2.c								\
				pipe/pipe3.c								\
				pipe/pipe4.c								\
				utils/arg.c 								\
				utils/error.c 								\
				utils/free.c 								\
				utils/ft_strncpy.c 							\
				utils/prints.c 								\
				execs/reads.c								\
				execs/reads_2.c								\
				execs/reads_3.c								\
				execs/redirections.c						\
				execs/redirections2.c						\
				execs/redirections3.c						\
				execs/sort_redir.c							\
				execs/sort_redir_2.c							\
				utils/semicolon.c							\
				execs/path.c								\
				execs/path_2.c								\
				minishell.c 								\

SRC			=	$(addprefix $(SRC_PATH), $(SRC_NAME))

OBJ			=	$(SRC:.c=.o)

LIBFT		=	src/libft/

PRINTF		=	src/ft_printf_fd/

LIBFTEXEC	=	src/libft/libft.a

PRINTFEXEC	=	src/ft_printf_fd/libftprintf.a 

MOV			=	"."

all: 			$(NAME)

$(LIBFTEXEC):
				@$(MAKE) -C $(LIBFT) bonus
				@echo $(LIBFTEXEC) ready

$(PRINTFEXEC):
				@$(MAKE) -C $(PRINTF)
				@echo $(PRINTFEXEC) ready

.c.o:
				$(CC) $(FLAGS) -c $< -o $@

$(NAME):		$(LIBFTEXEC) $(PRINTFEXEC) $(OBJ)
				@$(CC) $(FLAGS) $(OBJ) -I$(HEADER) $(LIBFTEXEC) $(PRINTFEXEC) -o $(NAME) 
				@echo $(NAME) ready
				@echo $(NAME) created

clean:
				@/bin/rm -f  $(OBJ)
				@(cd $(LIBFT) && $(MAKE) clean)
				@(cd $(PRINTF) && $(MAKE) clean)
				@/bin/rm -f libft.a libftprintf.a
				@echo Objects and libraries cleaned

oclean:
				@/bin/rm -f  $(OBJ)
				@echo Objects cleaned

fclean: 		clean
				@/bin/rm -f $(NAME)
				@(cd $(LIBFT) && $(MAKE) fclean)
				@(cd $(PRINTF) && $(MAKE) fclean)
				@/bin/rm -f libft.a libftprintf.a
				@echo $(NAME) deleted

re: 		fclean all

.PHONY:		all clean fclean re