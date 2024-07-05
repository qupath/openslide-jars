# openslide-jars

This is a set of scripts for building simple OpenSlide .jar files
for Windows, Mac, Linux (x86_64)
and Mac (x86-64, aarch64). It simply repackages OpenSlides natives, built in
the [openslide-bin](https://github.com/openslide/openslide-bin/releases/)
repo.

Releases and snapshots are published to
[SciJava Maven](https://maven.scijava.org/content/repositories/releases/io/github/qupath/openslide/).

## Making a new release

The version downloaded is specified in `download-artifacts.rb`, while the version uploaded to Maven is specified in `build.gradle`.
eg, to download release 4.0.1, edit the default version downloaded to be:

```ruby
target_release = options[:version] || "v4.0.1"
```

Then, to publish this version as `4.0.1-SNAPSHOT` on Maven, edit the gradle build script accordingly:

```groovy
version = '4.0.1'
```

and run the relevant github action (publish release or snapshot, depending).
