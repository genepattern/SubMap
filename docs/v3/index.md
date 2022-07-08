<!-- remove all comments before releasing -->
<!-- This is the name of the module as it will appear in GenePatter, and its version, for clarity -->
# ExampleModule (v2)

<!-- A brief text description of the module, usually one sentence in length. -->
**Description**: This is an example GenePattern module written in Python 3. It can be used as a template for future modules. It reads a file and potentially adds a line of text

<!-- This field is for the author or creator of the module. If the algorithm of the module is from a published paper, this is usually the first or corresponding author from the paper. If the module algorithm is unpublished, this is usually the developer of the module itself. This field can simply be a name of a person or group. -->
**Authors**: Edwin F. Juarez; UCSD - Mesirov Lab, UCSD; Barbara Hill - Mesirov Lab, Broad Institute

<!--This field is used for responding to help requests for the module, and should be an email address or a link to a website with contact information or a help forum. -->
**Contact**: [Forum Link](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!forum/genepattern-help)

<!-- All modules have a version number associated with them (the last number on the LSID) that is used to differentiate between modules of the same name for reproducibility purposes. However, for publicly released software packages that are wrapped as GenePattern modules, sometimes this version number will be different that the version number of the algorithm itself (e.g. TopHat v7 in GenePattern uses version 2.0.8b of the TopHat algorithm). Since this information is often important to the user, the algorithm version field is an optional attribute that can be used to specify this different version number. Remove this field if not applicable -->
**Algorithm Version**: _OPTIONAL_ and Not applicable for this particular module

<!-- Why use this module? What does it do? If this is one of a set of modules, how does this module fit in the set? How does it work? write overview as if you are explaining to a novice. Include any links or images which would serve to clarify -->
## Summary

This is an example GenePattern module written in [Python 3](https://www.python.org/download/releases/3.0/).
It can be used as a template for future modules. It reads a file and potentially adds a line of text.

<!-- appropriate papers should be cited here -->
## References

<!-- links to your source repository **specific to the release version**, the Docker image used by the module (as specified in your manifest), and (if applicable) the sha link to the Dockerfile used to build your Docker image -->
## Source Links
* [The GenePattern ExampleModule v2 source repository](https://github.com/genepattern/ExampleModule/tree/v2)
* ExampleModule v2 uses the [genepattern/example-module:2 Docker image](https://hub.docker.com/layers/150060459/genepattern/example-module/2/images/sha256-ae4fffff67672e46b251f954ad226b7ad99403c456c1c19911b6ac82f1a27f2f?context=explore)
* [The Dockerfile used to build that image is here.](https://github.com/genepattern/ExampleModule/blob/v2/Dockerfile)

## Parameters
<!-- short description of the module parameters and their default values, as well as whether they are required -->

| Name | Description <!--short description--> | Default Value |
---------|--------------|----------------
| filename * |  The file to be read in txt format |
| add_custom_message * | Whether or not to add a custom message. | False |
| message_to_add  | What message to add (if any) |
| output_filename * | The basename to use for output file (no need to add ".txt" at the end) |

\*  required

## Input Files
<!-- longer descriptions of the module input files. Include information about format and/or preprocessing...etc -->

1. filename  
    A long form explanation of the parameter. For example: This is the file which will be read in by the python script and to which text will be added, if add_custom_message is set to true. The parameter expects a text file with a .txt extension (e.g. file.txt)
    
## Output Files
<!-- list and describe any files output by the module -->

1. \<output_filename\>.txt  
    The input file plus any text you added, if you chose to add text.
2. stdout.txt
    This is standard output from the Python script. Sometimes helpful for debugging.

## Example Data
<!-- provide links to example data so that users can see what input & output should look like and so that they and we can use it to test -->

Input:  
[data_placeholder.txt](https://github.com/genepattern/ExampleModule/blob/v2/data/data_placeholder.txt)

Output:  
[created_file_ground_truth.txt](https://github.com/genepattern/ExampleModule/blob/v2/gpunit/output/basic_test/created_file_ground_truth.txt)


## Requirements
<!--This section is typically used to list any special requirements for running the module, such as, language/operating system requirements and Docker images. -->

Requires the [genepattern/example-module:2 Docker image](https://hub.docker.com/layers/150060459/genepattern/example-module/2/images/sha256-ae4fffff67672e46b251f954ad226b7ad99403c456c1c19911b6ac82f1a27f2f?context=explore).

## License

`ExampleModule` is distributed under a modified BSD license available at [https://github.com/genepattern/ExampleModule/blob/v2/LICENSE.](https://github.com/genepattern/ExampleModule/blob/v2/LICENSE)

## Version Comments
<!--For each version of a module, provide a short comment about what was changed in the new version of a module. Version comments consist of 3 parts: a date, a version number, and a short description. The date should be the release date of that version of the module, and the version number should match the version of the module for which it corresponds to. The description can be short, but should be informative (e.g. "added support for log transformed data", or "fixed bug with out of memory exception"). When a user views the documentation, all version comments up to and including the current version will be displayed, and act as a short version history for the module. -->

| Version | Release Date | Description                                 |
----------|--------------|---------------------------------------------|
|  1.4  | May 17, 2021 | Added all GenePattern Team module release requirements and renamed as ExampleModule, from ABasicModule. |
| 1 | May 1, 2018 | Initial version for team use. |
