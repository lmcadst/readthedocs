# Read the Docs image

**Container Image for building Read the Docs documentation.**


## Usage

Run the commands directly from the host without entering the container shell:

``` bash
podman run --rm --privileged -t -v "$PWD":/docs github.com/lmcadst/readthedocs make html
```

To clean the build

```
podman run --rm --privileged -t -v "$PWD":/docs github.com/lmcadst/readthedocs make clean
```

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.

