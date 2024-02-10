load_brew () {
    local brew_path

    if [[ -x /opt/homebrew/bin/brew ]] ; then
        brew_path=/opt/homebrew

    elif [[ -x /usr/local/bin/brew ]] ; then
        brew_path=/usr/local

    else
        return
    fi

    # This (minus the cached-source) is the way brew officially seems to expect you to set up its
    # variables, although I don't like that it puts itself in front of standard system paths.
    #
    # ref: https://docs.brew.sh/Manpage#shellenv
    cached-source ${brew_path}/bin/brew shellenv

    # Add shell completion for brew and brew-installed tools
    #
    # ref: https://docs.brew.sh/Shell-Completion
    fpath+=(${brew_path}/share/zsh/site-functions)

    if [[ -d ${brew_path}/share/google-cloud-sdk ]] ; then
        source ${brew_path}/share/google-cloud-sdk/path.zsh.inc
        source ${brew_path}/share/google-cloud-sdk/completion.zsh.inc
    fi

}

load_brew
