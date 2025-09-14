if status is-interactive
    # onde o asdf guarda os plugins e shims
    set -x ASDF_DATA_DIR $HOME/.local/share/asdf

    # binário do asdf (instalado pelo Go)
    set -x PATH $HOME/go/bin $PATH

    # shims do asdf (executáveis gerenciados)
    set -x PATH $ASDF_DATA_DIR/shims $PATH
    # JAVA
    set -Ux JAVA_HOME /usr/lib/jvm/java-24-temurin-jdk

    # ANDROID
    set -Ux ANDROID_HOME $HOME/Android/Sdk

    # PATH
    set -Ux PATH $PATH $ANDROID_HOME/emulator
    set -Ux PATH $PATH $ANDROID_HOME/tools
    set -Ux PATH $PATH $ANDROID_HOME/tools/bin
    set -Ux PATH $PATH $ANDROID_HOME/platform-tools

    function v
        nvim $argv
    end

    ## alias 
    alias ls='colorls'
    alias ff='fastfetch'
    # Commands to run in interactive sessions can go here
end
