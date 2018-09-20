# This script takes care of testing your crate

set -ex

main() {
    cross build --target $TARGET --release --all-features

    if [ ! -z $DISABLE_TESTS ]; then
        return
    fi

    cross test --target $TARGET --release --all-features
}

# we don't run the "test phase" when doing deploys
if [ -z $TRAVIS_TAG ]; then
    main
fi
