# selectR

For when you've got muiltiple versions of R on a system, but you've still got work to do!

`selectR` is a thin wrapper around the familiar `R` and `Rscript` command line tools on Linux.

With selectR in place, the version of R you use (from those you already have installed) is up to you.

There are many reasons why you might have multiple versions of R installed. Perhaps you need the old version for compliance or compatability, or perhaps you're just an experimenter.

When you use multiple versions of R withing RStudio Server Pro, you specify them in a file called '/etc/rstudio/r-versions'.

selectR leverages this file (though you can use the file without installing RSP) to decide what your default R version will be.

To use a different version of R, you just need to set a single environment variable and selectR will help you do that too.

## The r-versions file.

You may have come across this file if you use RStudio Server Pro. It's a flat file in '/etc/rstudio/r-versions', which contains the path to all of the R versions installed on your system.

So it might look something like this:

```
/opt/R/3.5.0/lib64/R
/opt/R/3.4.3/lib64/R
/opt/R/3.3.3/lib64/R
```

In this example, we have 3 versions of R installed on the system.

If you use RSP, you may already have this file. If not, you can create one anyway and selectR will allow you to use those R versions in command line situations.

## Installation

Definitely still some work to do here. For now let's go with making sure the scripts are somewhere on your path, before any pre-existing R or Rscript.

If you then run `selectR init`, this will create the R and Rscript commands that selectR will use.

## Usage

After the `selectR init` described above, you'll have the following four commands at your disposal:

* selectR
* test.R
* R
* Rscript

R and Rscript do exactly what you'd expect them to do. R starts an interactive R session at the command line and Rscript is the R command interpreter that can be used for writing command line tools in R.

The default version of R at this point is whichever version is first in the list from '/etc/rstudio/r-versions'.

test.R prints some output about the currently selected version of R, similar to the following:

```
R version 3.5.0 (2018-04-23) 
Number of installed Packages: 206 
Default CRAN: @CRAN@ 
Default library paths: /Library/Frameworks/R.framework/Versions/3.5/Resources/library 
       jpeg         png        tiff       tcltk         X11        aqua 
       TRUE        TRUE        TRUE        TRUE       FALSE        TRUE 
   http/ftp     sockets      libxml        fifo      cledit       iconv 
       TRUE        TRUE        TRUE        TRUE       FALSE        TRUE 
        NLS     profmem       cairo         ICU long.double     libcurl 
       TRUE        TRUE        TRUE        TRUE        TRUE        TRUE 
```

finally selectR itself prints some help output:

```
 -------- selectR --------

R installations available on this system (The first is the default):
    /opt/R/3.5.0/lib64/R
    /opt/R/3.4.3/lib64/R
    /opt/R/3.3.3/lib64/R

To override the default use 'export R_HOME=/path/to/R', using a path from the list above"

If the 'R' or 'Rscript' commands don't work, make sure 'selectR init' was run after installation
```

The R versions listed will reflect what you have in your /etc/rstudio/r-versions.

Running `selectR -q` just prints the R version information with none of the surrounding help text.

# Changing the current R 

using the information printed by the 'selectR' command, we need to export an environment variable called R_HOME.

To stick with our existing example, if we wanted to use the second version of R listed, version 3.4.3, we'd do this:

```
export R_HOME=/opt/R/3.4.3/lib64/R
```

This will switch our R and Rscript versions to use this version of R for as long as the environment variable is set. This is usually the duration of your session, unless you run `unset R_HOME` or otherwise overwrite the variable.

If you need such a setting to persist, you can add it to the end of your .bashrc.

At any time, running `test.R` will print the current version of R.

## Caveats and stuff

This is quick new and I haven't tested it very thoroughly at all yet, so your mileage may vary.

## License

MIT © [Mark Sellors](https://github.com/sellorm)
