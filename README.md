# CommandBox Github Action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-CommandBox-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=)](https://github.com/marketplace/actions/box-command)

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