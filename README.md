simplenote-export
=================

Introduction
------------

These scripts help massage plain text export of Simplenote notes for use in
other systems. I created them to get my notes ready for access via
Notational Velocity.

Installation
------------

Just copy the scripts where you like them.

Running
-------

First, split your Simplenote export into one file per note. Do this in an
empty directory.

    $ splitnotes.sh /path/to/simplenote_export_1.txt

Next, rename each note file based on the note title.

    $ namenotes.sh x??

If some notes aren't renamed, they may be fragments of other notes, so just
cat them back on where they belong.

Finally, modify the note files to remove Simplenote headers and change their
modification times to when the notes themselves were modified.

    $ modnotes.sh *.txt

To use in Notational Velocity, just cp -a the files into NV's notes directory.
