starship init fish | source

if status is-interactive
    # onde o asdf guarda os plugins e shims
    set -x ASDF_DATA_DIR $HOME/.local/share/asdf

    # binário do asdf (instalado pelo Go)
    set -x PATH $HOME/go/bin $PATH

    # shims do asdf (executáveis gerenciados)
    set -x PATH $ASDF_DATA_DIR/shims $PATH
    # JAVA
    set -Ux JAVA_HOME /usr/lib/jvm/java-25-temurin-jdk

    # ANDROID
    set -Ux ANDROID_HOME $HOME/Android/Sdk

    # PATH
    set -Ux PATH $PATH $ANDROID_HOME/emulator
    set -Ux PATH $PATH $ANDROID_HOME/tools
    set -Ux PATH $PATH $ANDROID_HOME/tools/bin
    set -Ux PATH $PATH $ANDROID_HOME/platform-tools

    set -Ux PATH $HOME/.local/bin $PATH
    function v
        nvim $argv
    end

    abbr ytmp3 'yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
    abbr ytmp4 'yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s"'
    abbr ytplmp3 'yt-dlp -x --audio-format mp3 -o "%(playlist_index)02d - %(title)s.%(ext)s"'

    ## alias 
    alias ls='colorls'
    alias ff='fastfetch'
    alias upg='sudo dnf upgrade --refresh -y && flatpak update -y'
    # Commands to run in interactive sessions can go here
end
alias xcc="xclip -selection clipboard " 
alias tma="tmux attach -t " 
