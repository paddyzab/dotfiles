source "$HOME/.cargo/env"
export ANDROID_HOME="/root/Android/Sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME:platoform-tools
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
