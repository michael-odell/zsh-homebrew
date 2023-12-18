load_brew () {
    local brew_path

    if [[ -x /opt/homebrew/bin/brew ]] ; then
        brew_path=/opt/homebrew

    elif [[ -x /usr/local/bin/brew ]] ; then
        brew_path=/usr/local

    else
        return
    fi

    # The brew shellenv code doesn't play nicely with subshells (for instance, in tmux), it may add
    # itself to the path a second time in a new spot.  But it always sets HOMEBREW_PREFIX, so if that's
    # unset I know I haven't called it yet.
    if [[ -z "${HOMEBREW_PREFIX:-}" ]] ; then

        # This (minus the cached-source) is the way brew officially seems to expect you to set up its
        # variables, although I don't like that it puts itself in front of standard system paths.
        #
        # ref: https://docs.brew.sh/Manpage#shellenv
        cached-source ${brew_path}/bin/brew shellenv
    fi

    # Add shell completion for brew and brew-installed tools
    #
    # ref: https://docs.brew.sh/Shell-Completion
    fpath+=(${brew_path}/share/zsh/site-functions)
}

load_brew
