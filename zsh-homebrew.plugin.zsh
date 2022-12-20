load_brew () {
    local brew_path

    if [[ -x /opt/homebrew/bin/brew ]] ; then
        brew_path=/opt/homebrew

    elif [[ -x /usr/local/bin/brew ]] ; then
        brew_path=/usr/local

    else
        return
    fi

    # This is the way brew officially seems to expect you to set up its
    # variables, although I don't like that it puts itself in front of
    # standard system paths.
    #
    # ref: https://docs.brew.sh/Manpage#shellenv
    eval "$(${brew_path}/bin/brew shellenv)"

    # Add shell completion for brew and brew-installed tools
    #
    # ref: https://docs.brew.sh/Shell-Completion
    fpath+=(${brew_path}/share/zsh/site-functions)
}

load_brew
