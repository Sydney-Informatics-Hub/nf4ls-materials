# Instructor notes 

## Overview 

Learning Nextflow for the first time can be daunting due to the number of features, settings, and concepts that new users need to learn. Many existing Nextflow documentation and training materials outline the things that you can do, but lacks clarity on the key ones required to get started with developing your own pipeline. 

This workshop helps life scientists overcome those barriers by: 

- Focusing on the essential concepts required to build a functional pipeline 
- Introducing these concepts sequentially, with each step building on earlier understanding 
- Demonstrating these ideas first in a simple “toy” workflow, then applying them to a realistic bioinformatics example 

The workshop is divided into two parts: 

- **Part 1:** Foundations of Nextflow (processes, workflow scopes, channels, inputs/outputs, operators) 
- **Part 2:** Applying these foundations to build a real-world RNA-seq workflow 

The content is delivered as demonstrations (instructors guide participants through the rendered webpage) combined with hands-on exercises as either a code-along (follow the instructor), or independently (time is provided for learners to attempt exercises).

## Workshop components 

There are several links and documents required to run this workshop. This is a reference that compiles all of them. Instructions provided later in the document. 

| Component            | Description                                                                                                                                                    |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Instructor notes     | This page.                                                                                                                                                 |
| [Materials Repository](https://github.com/Sydney-Informatics-Hub/nf4ls-materials) | GitHub repository to generate the github pages with the teaching materials, content, and exercises                                                             |
| [Data repository](https://github.com/Sydney-Informatics-Hub/nf4ls-data)      | GitHub repository to setup a new environment for attendees. Includes installing all required software, folder structure and files required to run the workshop |

## Strengths and weakenesses of the workshop

This section reflects on the feedback and experience from delivering this content from past workshops. These notes are compiled directly from participant (learner) feedback, and discussion between trainers, facilitators, and coordinators.

### Strengths 

Several elements of the current workshop have proven particularly effective and should be aimed to be kept in future delivery.

**Iterative, step-by-step code alone exercises**

The most consistent positive feedback relates to the incremental, guided nature of the materials. Each section builds directly on the previous one, helping learners form a model of how Nextflow pipelines are constructed that can be applied to their own development. As there are a lot of concepts that need to be selected from the documentation and introduced, this allows each of these to be explained in detail without overwhelming learners.  

**Opportunities for learners to code themselves**

Fold-out “solution” blocks work well: learners can attempt each exercise independently, then reveal the answer if needed. This supports mixed-experience groups while keeping that pace manageable. 

**Practical guidelines and best practices**

Many aspects of effective Nextflow development (e.g., naming, structure, dataflow thinking) are not immediately obvious from the official documentation. The workshop introduces these patterns and provides guidelines on how to implement them. 
 
**Pre-configured workshop environments**

The workshop needs the same folder structure and input files. Configuring learner compute environments on an Ubuntu VM (e.g. previously NCI Nirin, Nectar cloud) ensures all participants are using the same operating system, software version, and files. This has worked fantastically and allowed the workshop to focus on the delivery of teaching material. 

### Weaknesses and suggested improvements 

While the workshop has been well-received, these are several areas that could be optionally improved to strengthen learning outcomes and meet sound curriculum design. 

**Limited learning assessments and formative checks**

The workshop relies heavily on guided explanation and code-alongs, which works well given the conceptual load. However, this does not explicitly test understanding. Learning is determined when code is added correctly, and when pipelines run as intended - this does not guarantee learners understanding the introduced concept.  

Suggested improvements: 

- [Develop small assessments](https://training.galaxyproject.org/training-material/topics/contributing/tutorials/design/tutorial.html#develop-assessments-to-ensure-progression) to ensure learner understanding. For example, formative assessments throughout the workshop such as asking learners to reflect and note how they would apply concepts to their own pipelines; or inviting learners to reflect and note what they have learnt, want to know about further, and a question 

**Polls are not effective**

Recurring feedback includes poll questions tend to be vague, and allowing enough time for learners to respond was insufficient. 

Suggested improvements: 

- Consider how learners will access polls and ensure individual participant. i.e. can everyone submit a response?
- Replace polls with the formative checks mentioned above 

**Part 1 is too slow**

The section on bash (Part 1.2) occupies too much time given that this is a prerequisite for learners. This was inherited from an early version of the workshop that was tightly linked to Seqera’s Hello Nextflow training. 

Suggested improvements: 

- Remove section 1.2, or move this to a brief overview at the start of the next section 
- Use the gained time to focus on the Nextflow-specific concepts towards the end of Part 1 

## Pre-workshop

Familiarise yourself with the content by running through the self-directed workshop at TBA 

It is essential that all participants and trainers use the same version of software and have the same computational resources. We highly recommend you configure virtual machines for learners to access and use for the workshop exercises.  

See nf4ls-data: Machine requirements for the minimum specifications required per user. 

Configure your own fork of the materials, following nf4ls-materials: How to setup your own copy of the training materials 

Amend the rendered page with your workshop details (e.g. trainers, facilitators) 

Optionally:

- Add, change, amend any content on your fork 
- Suggest changes to the nf4ls-materials or nf4ls-data content so future instructors can benefit from your improvements. See contribution guidelines (coming soon)

On your selected infrastructure, follow nf4ls-data: Installation and setup to configure an environment with all software, containers, and files required for the workshop.

All other preparation, rehearsals to prepare for confident delivery 

## Delivery tips 

- Have VSCode, and the rendered content on your screen as you deliver 
- Trainers invite learners to copy and paste code blocks throughout the workshop for accuracy (i.e. avoid typos that result in pipeline errors). 
- Trainers type out code additions and explain as they type. This allows trainers to provide more context and explain what is being added. Also helps to slow the pace of delivery to allow learners to catch up. 
- Trainers verbally announce when they are moving between windows or tabs. For example “I am now going to the VSCode terminal...”. Participants will need to manage going between the workshop content in their browser, VSCode, and Zoom and this will help them follow you 

# Lesson guides 

## Overall

The goal of this workshop is to teach Nextflow best practices, and highlight the most important features to know and learn about amongst Nextflows large, and often daunting, repertoire. 

Whilst there is a lot of technical information that needs to be covered in detail, remember to tie it back to the biology - your audience are bioscientists that need to use Nextflow to process data and run analyses for their research or applied goals. 

For example, why would a biologist care about learning Nextflow over a set of functional bash scripts? Throughout the lessons, provide examples of where a particular feature would be useful in the context of a researcher running. These will be suggested in the lesson-specific subsections.

## Part 1

### 1.3 Writing your first pipeline

This is the first hands-on Nextflow exercise. In this lesson, you will guide learners through their initial Nextflow exercise by introducing them to the **fundamental building blocks of a minimal Nextflow script**. You'll cover the `process` and `workflow` scopes inside the `main.nf` file, focusing on key `process` components like `input`, `ouput`, and `script`. Your main aim is to ensure learners understand the minimum components needed for a simple, working, one-step pipeline.

To repeat the content, this is important and the model will be used in later steps:

>The order of steps taken to build the process in the following exercises are intentional. We will be building processes by defining each process block starting with the script then the output. In later sections, we will add input and process directives to this order.
>
>This order is not prescriptive, however, the script logic often determines how the other process blocks should look like and this order can be helpful for breaking down building processes in a logical way. This approach will be continued in Part 2, when you build an RNAseq workflow!

- Highlight that this lesson is to introduce only the minimum requirements for a Nextflow script.
- Reinforce that there are many ways to achieve the same thing but it is important to be consistent (e.g. see individual concepts below).
- Ensure they grasp the core concept of having a `process` that does something simple, that is called in the `workflow`.
- You can use an analogy of `process` being similar to a function in R or Python, but you need to call the function to run it.

=== "Syntax and styling"

    There may be FAQs around Nextflow syntax and styling. For example, if indentation matters - it does in e.g. Python, but Nextflow is relaxed. There are many ways to style, indent, comment, and order code (e.g. process blocks: input, output, script), as well as place process scopes (modules vs. main.nf) and parameters (workflow{}, nextflow.config).

    - Nextflow is flexible, you can do things differently and achieve the same outcome without error
    - It is important to do things consistently for legibility
    - This is especially important when you collaborate with others
    - Recommend to adopt the approaches demonstrated in the workshop

=== "Single vs. double quotes"
    
    String interpolation etc.

=== "`script` block interpreter"
    
    bash by default, can use #!/bin/python. Recommended? usually not.

### 1.4 Running pipelines

In this lesson, you will guide learners through executing the basic pipeline developed in the previous section using `nextflow run`. The focus here is to highlight the **key outputs, and help learners understand these in detail. This includes the Nextflow log that is printed to the terminal, the importance of unique run names and hashes, and the files output by the pipeline such as the `work` directory. Once the `work` directory is explained, you will lead into how this is used as a cache for resuming workflows with the `-resume` flag. Finally, you will explain the `publishDir` directory to show how outputs can be organised more conveniently.

- After running a pipeline, teach learners how to read the terminal output and understand the key lines of the Nextflow log. Explain line-by-line and in detail.
- Emphasise the importance of the `work` directory for storing logs and how it plays a role in caching and resuming workflows
- Be direct with learners: Nextflow runs produces many files. Using `publishDir` is a best practice to keep the outputs you want organised, in a predictable place, especially as workflows scale up.
- This is a key feature that Nextflow has over, for example, bash scripts. You will need to manually write a checkpointing feature in bash, whereas it come "out of the box" in Nextflow.

### 1.5 Inputs and channels

This lesson introduces channels with exercises to create a channel, passing a string into a process, and updating the process to expect a string input.

Emphasise that **channels are one of the trickiest concepts to learn in Nextflow**, but **getting it right is crucial as it is what makes Nextflow efficient and reproducible**. It can be tempting for new learners to manually process inputs and outputs within R or Python scripts (with exceptions: creating folders, moving files, error/file checking), but this **must** be done the Nextflow way, using channels.

Reassure learners that this lesson will focus on a conceptual introduction to channels, and Part 2 will provide learners with opportunities to implement channels for different bioinfomatics use cases. There are different ways that channels should be used, and manipulated with groovy, but this is beyond the scope of this introductory workshop. Suggest useful resources such as [Nextflow patterns](https://nextflow-io.github.io/patterns/) which have examples of different use cases using channels. 

Key things to mention:

- Channels are the backbone of Nextflow workflows. It passes information (data, parameters, values) into and between processes. 
- Channels are how Nextflow allows you to run jobs in parallel - when set up correctly Nextflow will automatically figure out which jobs are ready to be run.
- Clarify the difference between multiple inputs vs. multiple channels
- DO NOT use publishDir as an input to a process. publishDir is a way to organise important output files after jobs finish running. Use channels.

### 1.6 Parameters

This lesson demonstrates how learners can leverage parameters to make your Nextflow pipelines flexible (not specififying fixed names, files, paths, or values) for many different files and options. The key idea to communicate is that we develop pipelines because, more often than not, need to run the same processing over many samples. If you develop the pipeline to work on one sample, it will need to be updated when the sample change. Parameters overcome this by allowing users to specify different values during runtime, or use a default if none is specified.

Reinforce the use of parameters through the exercises. For the last exercise, allow 5 minutes for learners to experiment adding different values (strings) to the `--greeting` and `--outdir` parameters. Suggest that they can use the solution and inspect the output but to have a go themselves. Remind learners that multi-word strings must be enclosed in either single or double quotes.

### 1.7 Adding processes

This lesson is the first demonstration of connecting processes, where the output of `SAYHELLO` is used as an input to a new `CONVERTOUPPER` process.

Suggest spending minimal time demonstrating what `tr` does to allow learners more time to indpendently work through the exercise involving piecing together the `CONVERTTOUPPER` process. Encourage learners the use of hints.

Recall that the order we suggest of adding a new process is reflected in the hints:

1. `script`
2. `output`
3. `input`
5. Updating `workflow{}`

=== "Accessing process outputs"

    There are different ways to access outputs:

    - Adding `.out` to the end of a process name only works for single-element channels
    - For single-element channels, using `.out[0]` is identical to `.out`
    - `emit` can be used to [name output](https://www.nextflow.io/docs/latest/process.html#naming-outputs)

### 1.8 Dynamic naming

Similar to lesson 1.6 Parameters, this lesson will guide learners to make pipelines more flexible and adaptable for use across samples by automatically (dynamically) naming output files based on the name of the input. This becomes important to correctly identify outputs when running across multiple samples or files.
