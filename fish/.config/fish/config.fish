
alias gst="git status"
alias gco="git checkout"

alias vup="vagrant up"
alias vsh="vagrant ssh"
alias vpr="vagrant provision"
alias vst="vagrant status"
alias lsa="ls -hal"

function fish_prompt --description "Write out a custom prompt"

	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	set -l git_prompt (__fish_git_prompt)

	if not set -q __fish_prompt_git
		set -g __first_prompt_git (set_color green)
	end

	if not set -q __fish_prompt_cwd
		set -g __fish_prompt_cwd (set_color $fish_color_cwd)
	end

	set_color yellow
	printf '%s' $USER
	set_color normal
	printf ' at '
	set_color magenta
	printf $__fish_prompt_hostname
	set_color normal
	printf ' in '
	set_color green
	printf '%s' (prompt_pwd)
	set_color normal
	set -l git_prompt (__fish_git_prompt)
	if test -n "$git_prompt"
		printf ' on'
		printf "$git_prompt"
	end
	set_color normal
	printf ' > '

end


set -g JAVA_HOME (/usr/libexec/java_home)
