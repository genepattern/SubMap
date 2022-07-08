#!/usr/bin/env python3

from ExampleModule_functions import *
import argparse
import humanfriendly
from timeit import default_timer as timer
beginning_of_time = timer()

parser = argparse.ArgumentParser()
# ~~~~Module Required Arguments~~~~~ #
parser.add_argument("-f", "--filename",
                    type=str,
                    help="Name of the file to be read")
parser.add_argument("-a", "--addtext",
                    type=str,
                    help="Wether or not to add a custom message",
                    default='False')
parser.add_argument("-m", "--message",
                    type=str,
                    help="What message to add (if any)",
                    default='False')
parser.add_argument("-o", "--output_filename",
                    type=str,
                    help="The basename to use for output file",
                    default='TCGA_dataset')

# ~~~~Development Optional Arguments~~~~~ #
# Reminder: "store_true" args, are False by default and when the flag is passed
# then they become True
parser.add_argument("-v", "--verbose",
                    action="store_true",
                    help="increase output verbosity")
parser.add_argument("-d", "--debug",
                    action="store_true",
                    help="increase output verbosity")
args = parser.parse_args()
if args.verbose:
    print("Ah! The old verbosaroo")

print("~~~~~~~~~~~~~~~~~~~~~~")
print("Using arguments:")
print(args)
print("Now getting work done.")
print("~~~~~~~~~~~~~~~~~~~~~~")


if args.addtext == "True":  # This arg is read as a string, not boolean
    # First read the file
    f = open(args.filename)

    # Open the output file
    out_filename = args.output_filename
    if not out_filename.endswith('.txt'):
        out_filename = out_filename + '.txt'

    with open(out_filename, 'w') as g:
        for line in f.readlines():
            g.write(line)
        g.write('\n')  # This could be an argument, wether or not to add a newline.
        g.write(args.message)
    f.close()
else:
    print("Nothing shall be done.")

end_of_time = timer()
print("We are done! Wall time elapsed:", humanfriendly.format_timespan(end_of_time - beginning_of_time))
