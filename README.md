## Fulcrum Expressions [![Build Status](https://secure.travis-ci.org/fulcrumapp/fulcrum-expressions.svg)](http://travis-ci.org/fulcrumapp/fulcrum-expressions)

This implements the runtime for javascript expressions in Fulcrum.

### Setup
```sh
npm install -g browserify coffee-script
```

### Build

```sh
make
```

### Distribute

Builds the final output

```sh
make dist
```

### Copy files to other repositories

Copies the build output and docs to the other repositories (each are optional, but at least one is needed).

You can define the paths to the Fulcrum repos using environment variables in your shell config:

```
export FULCRUM_ANDROID=/path/to/android/app
export FULCRUM_IOS=/path/to/ios/app
export FULCRUM_WEB=/path/to/web/app
export FULCRUM_SITE=/path/to/website
```

Or you can assign them in the make command:

```sh
FULCRUM_SITE=$HOME/dev/fulcrumapp.com make dist copy
```

```sh
make copy

or

make dist copy # clean, build and deploy everything
```

### Tests

```sh
make test
```

### Console

Starts an interactive node terminal with the functions available to call

```sh
./console
```
