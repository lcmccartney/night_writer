
## Night Writer

The idea of [Night Writing](https://en.wikipedia.org/wiki/Night_writing) was first developed for Napoleon's army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille's development of his [Braille tactile writing system](https://en.wikipedia.org/wiki/Braille).

This program generates Braille-like text from latin characters and also converts latin characters back to Braille-like text.

### Usage

The program is used from the command line like so:

```
$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```

A plaintext file `message.txt` is used to create a Braille simulation file `braille.txt`.

Then that Braille simulation can be converted back to normal text:

```
$ ruby ./lib/night_read.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
```


### Installation

```

```

### Simulating Braille

Braille uses a two-by-three grid of dots to represent characters. This concept is simulated by using three lines of symbols:

```
0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0
....0.0.0....00.0.0...
```

The `0` represents a raised dot. The period is an unraised space. The above code reads "hello world" in normal text.

Let's also constrain our Braille files to 80 braille characters (160 dots) wide.

## Learning Goals / Areas of Focus

* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying Enumerable techniques in a real context
* Reading text from and writing text to files

## Base Expectations

### An Interaction Model

The tool is used from the command line like so:

```
$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```

A plaintext file `message.txt` is used to create a Braille simulation file `braille.txt`.

Then that Braille simulation cna be converted back to normal text:

```
$ ruby ./lib/night_read.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
```

### Character Support

Use the [lowercase letters a-z here from the American Foundation for the Blind](http://braillebug.afb.org/braille_print.asp) for your project.

We also need to support capitalization. In Braille, capitalization comes from a shift character. You'll find that character at the end of the fourth row of the previous graphic. When that character appears, the next character (and only the next character) is a capital. So `e` comes out as one 2x3 set of Braille points, but `E` is 4x3: the shift character followed by the normal `e`. Consider how this will affect your line width restrictions.

## Development Phases

As you work to implement the project below are some ideas of how you might start into the problem.

If you'd like an example of how you might extract the File I/O into an external class, [check out this gist](https://gist.github.com/jcasimir/fd0ceaf731e79c9dd5da).

### 1. The Runner

Write a Ruby program that can just output a string like:

```
$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```

Then work to:

* Pull the specified output filename from the command line arguments and print it in the terminal
* Get the actual number of characters from the `message.txt` and output it in the terminal


## Extensions

### 1. Supporting Numbers

Return to the graphic referenced above and you'll find a the `#` in the bottom left corner. Notice that the representations for 1-9 are actually the same as a-i. This number sign is a "switch" which means that all of the following "letters", up to the next space, are actually numbers. After the space it's assumed that we're back to words/letters unless we see another number switch.

Add support for numbers to your program.

### 2. Supporting Contractions

There are contractions commonly understood in Braille. They're a single letter symbol (so it has spaces on each side) which stands in for a common word.

These should be used both when going from standard characters to Braille (ie, `from` is output as one character of Braille) and in your expansion from Braille to standard characters.

## Examples

Below are a few examples to help you develop your implementation. You're encouraged
to submit additional examples, especially for the extensions, as pull requests.

### lowercase character

    "a"

    0.
    ..
    ..

### two lowercase characters

    "ab"

    0.0.
    ..0.
    ....

### uppercase character

    "A"

    ..0.
    ....
    .0..

### two uppercase characters

    "AB"

    ..0...0.
    ......0.
    .0...0..

### 80 characters wide

    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
    ................................................................................
    ................................................................................

### 82 characters wide (41 English letters)

    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
    ................................................................................
    ................................................................................
    0.
    ..
    ..

### all characters

    " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    ..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..
    ..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......
    ..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0
    00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..
    .0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..
    ...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0
    00..00..0.
    .....0...0
    00.000.000
