
## Night Writer

The idea of [Night Writing](https://en.wikipedia.org/wiki/Night_writing) was first developed for Napoleon's army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille's development of his [Braille tactile writing system](https://en.wikipedia.org/wiki/Braille).

This program generates Braille-like text from latin characters and also converts latin characters back to Braille-like text.

#### Simulating Braille

Braille uses a 2x3 grid of dots to represent characters. This concept is simulated by using two columns with three lines of symbols:

```
0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0
....0.0.0....00.0.0...
```

The `0` represents a raised dot. The period is an unraised space. The above code reads "hello world" in normal text.

The Braille-like text is constrained in the files to 80 braille characters (or 160 dots) wide.

#### Character Support

Information regarding [lowercase letters a-z from the American Foundation for the Blind](http://braillebug.afb.org/braille_print.asp) was used as a reference in translating to Braille-like text.

In Braille, capitalization is represented by the following shift character: 

```
Shift:
         ..
         ..
         .0
```
    
When this character appears, the next character (and only the next character) is a capital. So `a` comes out as one 2x3 set of Braille points, but `A` is 4x3: the shift character followed by the normal `a`. 

```
"A":
        ..0.
        ....
        .0..
```

## Requirements:

### Installation

```
gem install ruby
```

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
