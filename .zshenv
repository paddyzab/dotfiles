source "$HOME/.cargo/env"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
