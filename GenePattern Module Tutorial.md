# Creating your First GenePattern Module 💻 🧬
---
Hello, and welcome to GenePattern! If you have found yourself reading this document, then you must be interested in learning about how to develop GenePattern Modules.

Lucky for you, this is the right place to be! 
We have written some steps for you so that your first module development process goes as smooth as possible.

Note that for certain steps, we will include a ⚠️ sign to indicate important facts. We will try to be as descriptive and succinct about these facts as possible to ensure that you are developing your module without any issues.

Without further ado, here are those steps:

## Steps 📖
---
#### Step 0.1 - If you have not already, [install GenePattern locally](https://www.genepattern.org/administrators-guide#docker) 📝


#### Step 1 - Under `Modules & Pipelines`, select `New Module`  ✅
- Selecting this option will take you to a new page where you will find a comprehensive module development interface.

> ## ⚠️ Important
> We are going to be working with the `ABasicModule` repository from Github. If you have not already cloned this repository to your local machine or downloaded the files as a ZIP, do so right away at the following [link]([https://github.com/genepattern/ABasicModule](https://github.com/genepattern/ABasicModule))
>
> We will be specifically working with the `.py` files under the `src` folder.

#### Step 2 - Specify Module Details 🔍
- When developing a GenePattern Module, there are 4 essential components:
	1. Details
	2. Support Files
	3. Command Line
	4. Parameters
- We will start by filling out the Module Details (Name, Description, Author, Organization, etc.)
> ## ⚠️ Important
>  The module we are working with will simply be adding text to an existing `.txt` file that a user provides as an input to the GenePattern Module. We will want our module to be kept `private`, and we will want our Docker Image to be `genepattern/docker-python36`.
>
> Our docker container can be found at the following [link](https://hub.docker.com/r/genepattern/docker-python36) for those interested.
> 
> Since this is our First Module,  our Version Increment will be `New major version (v1)` to indicate that our module is going to start at Version 1.
> 
> This module's category should be `Demo`, since our module's purpose is for demonstration / learning.
>  
> The final important detail to fill out here is the output file format. Here, since our module will be adding text to an existing `.txt` file, we will choose `.txt` as our output file format as well.
>  
>  The other details are not relatively important for the following basic module, so if the details were described above, make sure your module's details match the descriptions from above. In the future, your module(s) will involve details that are more applicable to the analyses done through GenePattern.

#### Step 3 - Include Support Files 📑
- In the `src` folder of the `ABasicModule` directory, there should be 3 `.py` files and 1 `.txt` file.
- Add those files to the current module you are working on (you can drag and drop those files to the form).
- We are adding these files to the module so that your module can carry out the processes included in your `.py` files.

#### Step 4 - Command Line Specifications ⌨️
> ## ⚠️ Important
> Since we are going to be running `.py` files, keep the command line type as `Custom`.
>  
>  To ensure that the command line understands we are running `.py` files, type `python` in the included text box as you would in the terminal.
>   
>  Following the `python` prefix, press the [Space] bar once and type `<libdir>ABasicModule.py` as shown here.
>   
>  What `<libdir>` does is it serves as a variable that the GenePattern server substitutes for the path to the working directory for where the uploaded files are stored. In basic terms, it finds your working directory of files for you!
>   
>  We then type `ABasicModule.py` to ensure that our module is processing this file each time it is called.

#### Step 5 - Add Parameters 🗳
- We are almost done! Now, we need to specify the required parameters for our module.
- If you haven't already, take a look at the `ABasicModule.py` file found under the `src` folder.
> ## ⚠️ Important
> There are 4 required parameters in this `.py` file, and they are all prefaced by `parser.add_argument()`.
>  
>  The 4 parameters we will want our module to include are:
>  1. filename
>  2. addtext
>  3. message
>  4. output_filename
> 
> For each of the 4 parameters, it is important to read through the `ABasicModule.py` file and pay special attention to each parameter's **flags**, **input type**, and **default values** (if any).
- The `filename` parameter's input field, unlike the other 3 parameters, should be a `File Field`. This option can be found under the drop down menu labeled `Type of field to display*:`.
- The `File Format` should be `.txt` since we will be altering the `.txt` file that is passed in as a parameter.
- The `addtext` parameter should have a default value of `False`. While writing this parameter, you should select the option `add a drop-down list` and add `True` to the list of values.
- `filename` and `addtext` should have 1 minimum number of values and 1 maximum number of values. This is to ensure that a `.txt` file is being processed and that a boolean value will determine whether text will be appended to the file.
- Conversely, `message` and `output_filename` will have 0 minimum number of values and 1 maximum number of values. This is because it is possible that the user wants to add nothing to the `.txt` file and the `output_filename` will have an arbitrary, default name of your choosing.

#### Final Step - Save and Run the Module 💾👟
- Now that we have developed our module, it is time to scroll to the top of the screen and choose the `Save & Run` option.
- We will now want to run our module and see if it works as expected.
	- First, we want to go to the Home screen of your GenePattern local installation.
	- Next, under `Search Modules & Pipelines`, type the name of your module
	- Once it shows up, select it
	- You will now test it by doing the following:
		1. Upload `created_file_ground_truth.txt` from the `src` folder of `ABasicModule`
		2. Set `addtext` to **True**
		3. Type any message you'd like
		4. Type any output filename you'd like
		5. On the bottom-right side of the screen, click the `Run` button
- From here, your program will (hopefully) run properly and produce a `.txt` file that includes your custom message.
- To open the `.txt` file, simply click on the hyperlink named `(your_file_name).txt` after your module has finished running. This will open your `.txt` in a new tab on your browser.

## Congratulations! 🎉 You have just created your first GenePattern Module
---
Now that you know the basics of how to develop a GenePattern Module, you are ready to go ahead and create your own modules for GenePattern.

Best of luck with your future work!
