# CommandBox Github Action

Run CommandBox commands in a standalone github action without installing CommandBox. Perfect for one-off commands such as `install`, `docbox generate`, `cfformat`, `cflint`, and task runners.

**Note:** This action is *not* suited for starting servers. Due to the nature of Github Actions, you must configure long-running background services in the workflow.

## Usage

### DocBox Usage

This example will run `docbox generate` and place the result in the `docs/` directory.

```yml
steps:
- uses: Ortus-Solutions/commandbox-action@v1
  with:
    cmd: docbox generate mapping=cbWire excludes=test|ModuleConfig strategy-outputDir=docs strategy-projectTitle=cbWire
```

### Box Install Usage

This example will install development dependencies listed in the `box.json` package file.

```yml
steps:
- uses: Ortus-Solutions/commandbox-action@v1
  with:
    cmd: install
```

### CFLint Usage

This example will run `cflint` against all .cfc files in the `models/` directory and fail the build if CFlint finds any issues of `WARNING` or `ERROR` level.

```yml
steps:
- uses: Ortus-Solutions/commandbox-action@v1
  with:
    cmd: cflint pattern=models/**.cfc exitOnError=true reportLevel=WARNING
```

### CFFormat Usage

This example will run `cfformat` on the `models`, `interceptors`, and `handlers` directories.

```yml
steps:
- uses: Ortus-Solutions/commandbox-action@v1
  with:
    cmd: cfformat run models,handlers,interceptors,tests/specs --overwrite
```

## Arguments

* `cmd` - The CommandBox command to run. No need to specify `box`!

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

## Code of Conduct

> :book: Do unto others as you would have them do to you - [Matthew 7:12](https://www.biblegateway.com/passage/?search=matthew+7%3A12&version=NIV)