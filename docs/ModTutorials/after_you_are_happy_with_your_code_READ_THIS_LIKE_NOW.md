If you haven't looked at this document, read it now:

https://docs.google.com/document/d/1WKi3cK9DICVUG2IKlu8FSD5SUatrpcfXog9x8ahHSoc/edit?ts=5a7c9f23

Other relavant doc:
https://docs.google.com/document/d/1QwpCHFFVAqmPovs515WJujeZuN_91nciK7q-ZDKq6mI/edit

Summary:  

#Starting a new Python module from scratch:
git clone https://github.com/genepattern/ExampleModule.git

# Structure of the blank_canvas_module
*probably to be called "ExampleModule" to be consistent with the docs and to make sure when sorted alphabetically it shows up at or near the top.*
- after_you_are_happy_with_your_code_READ_THIS_LIKE_NOW.txt
- build.xml
- data/
  + data_placeholder.txt
- doc.html
- gpunit/
  + template.yml
  + output/
    - readme.txt
- LICENSE
- manifest
- prerelease.version
- README.md
- release.version
- src/
  + deleteme.py

# To add in after_you_are_happy_with_your_code_READ_THIS_LIKE_NOW.txt
Before you begin: You may have already done some of these steps, that's okay, keep reading this document, treat it as a step-by-step checklist and make sure you have done everything here. If you have any questions ask the team. Feel free to ask Edwin Juarez <ejuarez@ucsd.edu> about what he meant when writing this (supposedly short) checklist. Note that this document attempts to summarize the minimal info contained in this other document: https://docs.google.com/document/d/1WKi3cK9DICVUG2IKlu8FSD5SUatrpcfXog9x8ahHSoc/edit?ts=5a7c9f23 (which was written by Bobbie, so she would be another person to ask clarifying questions).

0. Clone the repository *insert_repository_name_here* --> This is step zero because you likely first cloned this repo and opened this file. Good on you!
  0.1. There are some potential requirements for setting collaborators with the right permissions, but this may or may not be necessary, especially since all repositories are public. As of 2018-04-16 it suffices that the module creator is listed, i.e., nobody needs to be added as contributor or collaborator or anything like that. If you don't know why this is here, good, just move along, these are not the lines you are looking for.
1. Create a new module using the module creator (https://gp-beta-ami.genepattern.org/gp/modules/creator.jsf), this will create a manifest file for you.
2. Download these files, open the manifest file and check the LSID, it will look like something like this:
`LSID=urn\:lsid\:8080.gpserver.ip-172-31-26-71.ip-172-31-26-71.ec2.internal\:genepatternmodules\:23\:1.1.0`
  - Note: For now it is OKAY to use this weird-looking LSID. **You should delete these old, testing versions from the server**
  - Alternatively, you can name your early test module differently than the release module. But by now, it may be too late to change the name.
3. Look at the list of LSIDs and add a new entry to the List of modules and visualizers:
https://github.com/genepattern/common_module_code/blob/master/module.lsid.registry
  - txt2odf became: `LSID=urn\:lsid\:broad.mit.edu\:cancer.software.genepattern.module.analysis\:00372\:1.1.0`
4. Make sure the manifest file is in the top-most directory (e.g., txt2odf/) -- You may need to remove the manifest that was created for ExampleModule
  - Double check that the quality has been set to production (as opposed to development, since this module is set to be released), i.e., "quality=production"
5. Open build.xml and modify the second line "name=**INSERT_MODULE_NAME_HERE** (in this case it is txt2odf)
6. Open doc.html in a text editor and modify line 4, url=**INSERT_DOCUMENTATION_URL_HERE** to know what address to put there, follow these steps:
  - http://software.broadinstitute.org/cancer/software/genepattern/pages
    + You'll need to sign in with your Broad credentials
    + From "Edit Site Component" select "module_docs"
    + Find "a_simple_module (v1) and click "+copy" on the right hand side to get a template for your documentation
    + Modify this document accordingly (among other things make sure under "Published?" you select "Yes" to make sure it is world-viewable, make sure it is not beta, unless you actually want it to say it is a beta version)
      - You can change the LSID to show only the major version which is currently available, e.g., from 1.1.0 turns into 1
    + Once you have modified the document click the big green "submit" button
    + Find your module doc in this page (likely by searching for it using the "Filter Results By:" on the top right corner)
    + Click on the green "[magnifying glass icon] View" button, this will take you to the url you want to copy -- it is a good idea to open an incognito window and paste this url to make sure it can be viewed without login in
    + For the example module it looks like this: http://software.broadinstitute.org/cancer/software/genepattern/modules/docs/txt2odf/1
    + Note that the final version should match the current major release --> I.e., if your module is version 2.1.x and you want to pre-release it using Jenkins, you will need a link to the docs which ends with /3 (and the file release.version should also be 3 but more on that later)
7. All modules require a gpunit/ folder with passing GPunits -- read the README from this repository if you are not familiar with GPunits: https://github.com/broadinstitute/GpUnit
  - Modify the GP units accordingly
  - Test using something like this:
  `gpunit -Dgp.host=beta.genepattern.org -Dgp.url=https://beta.genepattern.org -Dgp.user=edjuaro  -Dgp.password="**PUT_EDJUARO's_PASSWORD_HERE**" gpunit`
  - See https://github.com/genepattern/txt2odf for an example of GpUnits which do more than a simple diff (i.e., a diff with some omissions)
  - Later in this document you will add these gpunits to the nightly tests
8. Make sure the repository has a license which is compatible with the project, the standard 2018 Mesirov Lab license can be found here: https://github.com/genepattern/txt2odf/blob/master/LICENSE
9. Check the contents of the manifest file,
  - Make sure it has a line which says taskDoc=doc.html
  - Make sure there is a line which lists the Docker image:tag to be used, for example: “job.docker.image=genepattern/docker-python36:0.4”
10. Open in a text editor and modify the prerelease.version file. Make sure this matches the intended NEXT minor of your module. E.g., if you want your module to be released as version X.Y.Z (meaning that your module is currently X.Y-1.Z), then set prerelease.number=Y
11. Edit README.md to add some details about the module
12. Open in a text editor and modify the release.version file. Make sure this matches the intended NEXT major version of your module. E.g., if you want your module to be released as version X.Y.Z meaning that your module is currently X-1.Y.Z), then set prerelease.number=X
  - Note: This value matters when you do a release of a module. Most of the time you will be doing a prerelease of the module, hence only the minor version of the module will change. Here are a couple examples to hammer down this issue:
    + Example 1: We want to do a prerelease of a module
    the three key values before the prerelease are:

    prerelease.number=3
    build.number=1
    doc_url = genepattern/modules/docs/txt2odf/1

    Those values will be changed after the prerelease

    prerelease.number=4
    build.number=1
    doc_url = genepattern/modules/docs/txt2odf/1
    **Module version 0.3**

    + Example 2: We want to do a major version release of a module
    the three key values before the release are:

    prerelease.number=4
    build.number=1
    doc_url = genepattern/modules/docs/txt2odf/1

    Those values will be changed after the prerelease

    prerelease.number=1
    build.number=2
    doc_url = genepattern/modules/docs/txt2odf/2
    **Module version 1.3**

13. Make sure your code is inside the src/ folder
14. Make sure you are working on the develop branch. If you are not and need to create a new branch do this:
git checkout -b develop
git commit -am "created a new branch"
git push --set-upstream origin develop

  14.1 Make sure all of the files in this folder are part of the branch (e.g., git add [add missing files here])  
15. Release the Module!
  - VPN to the broad
  - Go to Jenkins (http://cancerdev/hudson/)
  - Make sure you are logged in! (I think you need to be an admin)
  - Go to GP_Modules (one of the tabs in the mid-bottom screen)
  - Click on Release_GenePattern_Module
  - Click on configure because your new module will not be listed
  - Add your module name (capitalization matters) under "choice parameter" in this case we added "txt2odf" -- click Apply, then Save
  - Click on Build with Parameters (on the left side bar)
  - Select your module, in this case "txt2odf"
  - Click build. Hope for the best.
16. Once your module builds successfully, do a pull request from the dev branch of the repository to the master branch and have some other member of the team accept the pull request
17. Install your module from repository (you may need to be a GP Admin for this)
  If you are doing a release (Note: the very first time you go through this, you probably want to do a release of the module to have version 1.x out there):
  - Choose the prod repository
  If you are doping a pre-release:
  - Copy the zip file from the beta repository to the prod repository http://software.broadinstitute.org/webservices/gpModuleRepository/uploadForm.jsp

  **In general you want to do pre-releases, test using the Jenkins project "Single_Module_Test"**
  - Make sure you remove any versions that you had installed beforehand. Especially those with a different LSID. Check on "Modules & Pipelines" --> "Manage" to see double check your module is not listed twice
18. Add this module to the nightly test my modifying the develop branch of this document:
https://github.com/broadinstitute/GpUnit/blob/develop/buildsuites.xml
To get a sense of what lines of code look at this example:
  + Before I made any modifications for txt2odf: https://github.com/broadinstitute/GpUnit/blob/c27cdc8c6ee07d27aa4c085a0b8d7e16f0c69401/buildsuites.xml
  + After I made modifications/additions txt2odf: https://github.com/broadinstitute/GpUnit/blob/a6c1145fca70ada505fa257343517217ad652783/buildsuites.xml
19. Propose a tweet to the group (140/280 chars. max) (if appropriate) - Tweet when text is agreed upon.(Probably best to just ask Bobbie since she meta tools for this)
  - Example: "New module released: txt2odf, a straightforward tool to make tabular TXT files compatible with CompartiveMarkerSelectionViewer"
20. Add System message on Gpprod, GpBroad, gp-dev-ami and GP@IU (when appropriate) indicating the release of this module - basically just grab from Tweet (on GP server Administration -> System Message).
21. Send email to other GP administrators - VIB (?)
22. Update Released Modules (add a line on top): https://docs.google.com/spreadsheets/u/1/d/1sSi9R2tXtTSKsT9bKtSMF7yDfZGSCICBSOq2vrAFXHg/edit?hl=en_US&hl=en_US#gid=0
23. For visualizers which have been rewritten in JS - update this blog post: http://software.broadinstitute.org/cancer/software/genepattern/blog/2017/03/16/java-applet-based-visualizers-no-longer-function-in-any-browser
24. Check forum users need to be notified of release: https://groups.google.com/forum/#!forum/genepattern-help
25. Close any related bugs in JIRA.
26. Clean up any beta versions in the beta repository and rebuild the catalog.
