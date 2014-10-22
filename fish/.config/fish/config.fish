
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

	switch $USER

		case root

			if not set -q __fish_prompt_cwd
				if set -q fish_color_cwd_root
					set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
				else
					set -g __fish_prompt_cwd (set_color $fish_color_cwd)
				end
			end

			echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '# '

		case '*'

			if not set -q __fish_prompt_cwd
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end

			echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" (__fish_git_prompt) ' > '

	end
end

if test -e /usr/libexec/java_home
	set -g JAVA_HOME (/usr/libexec/java_home)
end
