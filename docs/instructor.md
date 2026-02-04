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

This workshop has been delivered as an online workshop, and as a hybrid format  

The content is delivered as demonstrations (instructors guide participants through the rendered webpage) combined with hands-on exercises as either a code-along (follow the instructor), or independently (time is provided for learners to attempt exercises).

## Workshop feedback and design

This section reflects on the feedback and experience from delivering this content from past workshops. These notes are compiled directly from participant (learner) feedback, and discussion between trainers, facilitators, and coordinators.

### To keep 

Several elements of the current workshop have proven particularly effective and should be aimed to be kept in future delivery.

**Iterative, step-by-step code alone exercises**

The most consistent positive feedback relates to the incremental, guided nature of the materials. Each section builds directly on the previous one, helping learners form a model of how Nextflow pipelines are constructed that can be applied to their own development. As there are a lot of concepts that need to be selected from the documentation and introduced, this allows each of these to be explained in detail without overwhelming learners.  

**Opportunities for learners to code themselves**

Fold-out “solution” blocks work well: learners can attempt each exercise independently, then reveal the answer if needed. This supports mixed-experience groups while keeping that pace manageable. 

**Practical guidelines and best practices**

Many aspects of effective Nextflow development (e.g., naming, structure, dataflow thinking) are not immediately obvious from the official documentation. The workshop introduces these patterns and provides guidelines on how to implement them. 
 
**Pre-configured workshop environments**

The workshop needs the same folder structure and input files. Configuring learner compute environments on an Ubuntu VM (e.g. previously NCI Nirin, Nectar cloud) ensures all participants are using the same operating system, software version, and files. This has worked fantastically and allowed the workshop to focus on the delivery of teaching material. 

### To improve

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

**Other delivery formats**

This workshop has been delivered online, and as a hybrid distributed model. Instructions and material here have been adapted to suit these models and may not account for other formats.

## Preparing to deliver the workshop

There are several steps in order to prepare for workshop delivery.

_SIH and the Australian BioCommons are working towards providing access to a a pre-configured compute environments for self-directed learning, as well as setting up VMs._

1. Familiarise yourself with the content by running through the workshop.
2. Identify the compute [resources and requirements](../setup/README.md/#machine-requirements) for participants and training team.

It is essential that all participants and trainers use the same version of software and have the same computational resources. We highly recommend you configure virtual machines for learners to access and use for the workshop exercises.  

3. Configure your own fork of the materials. See the [how-to guide](../README.md/#how-to-setup-your-own-copy-of-the-training-materials).

4. Amend the rendered page with your workshop details (e.g. trainers and facilitators involved, delivery details, institution) 

Optionally:

- Add, change, amend any content on your fork 
- Suggest changes to the nf4ls-materials content so future instructors can benefit from your improvements. See the [contribution guidelines](../CONTRIBUTING.md).

5. On your selected infrastructure, follow the [Setup instructions](../setup/README.md/#how-to-setup-a-new-environment) to install and  configure an environment with all software, containers, and files required for the workshop.

All other preparation, rehearsals to prepare for confident delivery 

## Delivery tips 

This workshop has been delivered and adapted for online delivery, with lead trainers sharing their screen and communicating content via Zoom. These tips are adapted for this format, and may not fit other formats such as full in-person delivery with a single trainer. 

- Have VSCode, and the rendered content on your screen as you deliver 
- Trainers invite learners to copy and paste code blocks throughout the workshop for accuracy (i.e. avoid typos that result in pipeline errors). 
- Trainers type out code additions and explain as they type. This allows trainers to provide more context and explain what is being added. Also helps to slow the pace of delivery to allow learners to catch up. 
- Trainers verbally announce when they are moving between windows or tabs. For example “I am now going to the VSCode terminal...”. Participants will need to manage going between the workshop content in their browser, VSCode, and Zoom and this will help them follow you 

## Lesson guides 

### Overall

The goal of this workshop is to teach Nextflow best practices, and highlight the most important features to know and learn about amongst Nextflows large, and often daunting, repertoire. 

Whilst there is a lot of technical information that needs to be covered in detail, remember to tie it back to the biology - your audience are bioscientists that need to use Nextflow to process data and run analyses for their research or applied goals. 

For example, why would a biologist care about learning Nextflow over a set of functional bash scripts? Throughout the lessons, provide examples of where a particular feature would be useful in the context of a researcher running. These will be suggested in the lesson-specific subsections.

### Part 1 - Fundamental Nextflow Concepts

| Lesson                              | Teaching Objective                                            | Learning Outcome                                                                              | Learning Experience                                                    | Approx. Time |
| ----------------------------------- | ------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------ |
| **1.0 Introduction to Nextflow** | High-level overview of Nextflow and its uses | Learners can identify the context of preliminary uses for bioinformatics pipelines                              | Lecture             | 10 min    |
| **1.1-1.2 Introduciton to Part 1 and Hello World!** | Introduce the structure of the iterative pipeline for Part 1 and the bash commands used | Learners can identify the high-level structure of piecing together bash commands in a pipeline                             | Demonstration and code-along              | 15 min    |
| **1.3 Writing your first pipeline** | Introduce the minimum viable structure of a Nextflow pipeline | Learners can identify and write a simple `process` and `workflow`                             | Guided code-along building a minimal pipeline step-by-step             | 20 min min    |
| **1.4 Running pipelines**           | Explain how Nextflow executes workflows and manages outputs   | Learners can run a pipeline, interpret logs, and understand `work`, caching, and `publishDir` | Live execution, log walkthrough, discussion of outputs and caching     | 15 min    |
| **1.5 Inputs and channels**         | Introduce channels as the core dataflow mechanism             | Learners understand why channels are required and how to pass simple inputs                   | Conceptual explanation + small exercises creating and passing channels | 20 min    |
| **1.6 Parameters**                  | Make pipelines flexible using parameters                      | Learners can define and override parameters at runtime                                        | Code-along with parameterised examples and short experimentation       | 15 min    |
| **1.7 Adding processes**            | Demonstrate chaining processes together                       | Learners can connect processes using outputs as inputs                                        | Guided exercise building and wiring a second process                   | 15 min    |
| **1.8 Dynamic naming**              | Introduce dynamic output naming                               | Learners can generate outputs that scale across inputs                                        | Short demonstration + modification of existing code                    | 15 min    |


#### 1.3 Writing your first pipeline

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
    
    **Double quotes** must be used when a variable needs to be passed. Single quotes will interpret a string literally. For example:
        
        - "Hello ${name}" -> `Hello Fred`
        - 'Hello Fred' -> `Hello Fred`
        - "Hello Fred" -> `Hello Fred`
        - 'Hello ${name}' -> `Hello ${name}`"

    Learners will gain practice with hands-on exercises requiring correct use of single/double quotes throughout the workshop.

=== "`script` block interpreter"
    
    By default, the `script:` block in a process is executed with bash. It is possible to use a different interpreter via a shebang (e.g. `#`/usr/bin/env Rscript` but can introduce some added complexity. Whilst out of scope for this introductory workshop, suggest adding scripts in the  [`./bin` directory](https://training.nextflow.io/2.1/advanced/structure/#bin).

#### 1.4 Running pipelines

In this lesson, you will guide learners through executing the basic pipeline developed in the previous section using `nextflow run`. The focus here is to highlight the **key outputs, and help learners understand these in detail. This includes the Nextflow log that is printed to the terminal, the importance of unique run names and hashes, and the files output by the pipeline such as the `work` directory. Once the `work` directory is explained, you will lead into how this is used as a cache for resuming workflows with the `-resume` flag. Finally, you will explain the `publishDir` directory to show how outputs can be organised more conveniently.

- After running a pipeline, teach learners how to read the terminal output and understand the key lines of the Nextflow log. Explain line-by-line and in detail.
- Emphasise the importance of the `work` directory for storing logs and how it plays a role in caching and resuming workflows
- Be direct with learners: Nextflow runs produces many files. Using `publishDir` is a best practice to keep the outputs you want organised, in a predictable place, especially as workflows scale up.
- This is a key feature that Nextflow has over, for example, bash scripts. You will need to manually write a checkpointing feature in bash, whereas it come "out of the box" in Nextflow.

#### 1.5 Inputs and channels

This lesson introduces channels with exercises to create a channel, passing a string into a process, and updating the process to expect a string input.

Emphasise that **channels are one of the trickiest concepts to learn in Nextflow**, but **getting it right is crucial as it is what makes Nextflow efficient and reproducible**. It can be tempting for new learners to manually process inputs and outputs within R or Python scripts (with exceptions: creating folders, moving files, error/file checking), but this **must** be done the Nextflow way, using channels.

Reassure learners that this lesson will focus on a conceptual introduction to channels, and Part 2 will provide learners with opportunities to implement channels for different bioinfomatics use cases. There are different ways that channels should be used, and manipulated with groovy, but this is beyond the scope of this introductory workshop. Suggest useful resources such as [Nextflow patterns](https://nextflow-io.github.io/patterns/) which have examples of different use cases using channels. 

Key things to mention:

- Channels are the backbone of Nextflow workflows. It passes information (data, parameters, values) into and between processes. 
- Channels are how Nextflow allows you to run jobs in parallel - when set up correctly Nextflow will automatically figure out which jobs are ready to be run.
- Clarify the difference between multiple inputs vs. multiple channels
- DO NOT use publishDir as an input to a process. publishDir is a way to organise important output files after jobs finish running. Use channels.

#### 1.6 Parameters

This lesson demonstrates how learners can leverage parameters to make your Nextflow pipelines flexible (not specififying fixed names, files, paths, or values) for many different files and options. The key idea to communicate is that we develop pipelines because, more often than not, need to run the same processing over many samples. If you develop the pipeline to work on one sample, it will need to be updated when the sample change. Parameters overcome this by allowing users to specify different values during runtime, or use a default if none is specified.

Reinforce the use of parameters through the exercises. For the last exercise, allow 5 minutes for learners to experiment adding different values (strings) to the `--greeting` and `--outdir` parameters. Suggest that they can use the solution and inspect the output but to have a go themselves. Remind learners that multi-word strings must be enclosed in either single or double quotes.

#### 1.7 Adding processes

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

#### 1.8 Dynamic naming

Similar to lesson 1.6 Parameters, this lesson will guide learners to make pipelines more flexible and adaptable for use across samples by automatically (dynamically) naming output files based on the name of the input. This becomes important to correctly identify outputs when running across multiple samples or files.

### Part 2

| Lesson                                  | Teaching Objective                                 | Learning Outcome                                                       | Learning Experience                                           | Approx. Time |
| --------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------- | ------------ |
| **2.0 Introduction**                    | Set context for Part 2 workflow                    | Learners understand the scenario, data, and end goal                   | Instructor walkthrough of data, tools, and workflow structure | 10 min    |
| **2.1 First process & containers**      | Convert a bash script into a containerised process | Learners can map bash scripts to Nextflow processes and use containers | Code-along converting bash → process with container           | 20 min    |
| **2.2 Samplesheets, operators, Groovy** | Introduce structured inputs and data reshaping     | Learners understand why tuples and operators are required              | Concept-focused walkthrough with examples and debugging demos | 30 min    |
| **2.3 Multiple process inputs**         | Teach input structuring and process chaining       | Learners can decide when to group vs separate inputs                   | Guided workflow wiring with discussion of design decisions    | 25 min    |
| **2.4 Combining channels & outputs**    | Demonstrate aggregation patterns                   | Learners understand when aggregation is appropriate (e.g. MultiQC)     | Example-driven explanation using MultiQC                      | 30 min    |
| **2.5 Upscaling & introspection**       | Show how pipelines scale without code changes      | Learners understand scaling via configuration and samplesheets         | Demonstration + discussion; pointer to HPC workshop           | 25 min    |


=== "Part 2 goals and scope"

    Part 2 replicates a "real-life" example of how a bioscientist would encounter and code a Nextflow pipeline for the first time. The key goals of Part 2 include:

    - Demonstrating how the foundational Nextflow concepts introduced in Part 1 is applied in a practical scenario
    - Reiterate the key Nextflow concepts and components that are required for a simple bioinformatics workflow

    What Part 2 is **not**:

    - A guide on bioinformatics or data analyses, reviewing each input or output files and the inner workings of tools in detail
    
=== "Structured and repeated development across lessons"

    Each lesson (2.1 - 2.5) will focus on converting a bash script into a modular Nextflow process. This is to emphasise that there is some boilerplate that will not change across tools, scripts, and analyses in Nextflow pipelines. However, these must be tweaked to fit based on what will be input and output.

    For each lesson, you will guide learners to review:

    1. An existing bash script that conducts one bioinformatics data processing step
    2. Identify which components need to be implemented in a Nextflow process definition
    3. Build that Nextflow process, step-by-step, following a similar order

#### 2.0 Introduction

This section provides the context for Part 2, such as the scenario of converting individual bash scripts into a simple, end-to-end Nextflow pipeline. 

You will introduce:

- The files and data used for Part 2
- The bioinformatics tool
- Nextflow files that you will be changing
- The high-level structure of the workflow that learners will have built by the end of the workshop.

#### 2.1 Our first process and container

=== "Bash script to Nextflow process"

    This is the first occurrence of reviewing a bash script and converting it to a Nextflow process. Recall that, when defining a process, there is some boilerplate code that is unlikely to change (`input:`, `output:`, `script:`), but the contents of each need to be tailored (based on the bash scripts). 
    
=== "Using containers in Nextflow"

    There are many ways to manage software (e.g. modules, conda) and we consider using containers in Nextflow is the best practice. Containers package a tool together with its software environment so that everyone runs the same tool, same version, same dependencies, regardless of where the workflow is executed. As a Nextflow pipeline has many steps requiring different tools, using containers simplifies this and makes your pipeline reproducible.

    There are many container platforms and repositories. For bioinformatics, particularly use in Nextflow, recommend learners to use Singularity (widely supported on HPC systems and suitable for shared environments) and BioContainers that are hosted on quay.io (plenty of pre-built containers for thousands of bioinformatics tools and supported by Nextflow, nf-core, Galaxy)

    Learners do not need to understand the inner working of containers. The key things to communicate is knowing:
    
    - Why they are used
    - Where bioinformatics containers can be searched and retrieved from
    - How to implement a Nextflow process that uses a specific container

#### 2.2 Samplesheets, operators, and groovy

=== "Tuples: grouping related data"

    Tuples are introduced to group related pieces of information together (e.g. sample name + file paths) and prevent accidental mixing of file and metadata. At this stage, **focus on the why, not the mechanics.** 

    More tuple usage will be visited in later lessons.

=== "Reshaping data with operators"

    Operators are often one of the hardest concepts for Nextflow beginners, but one of the most important for developing reproducible and scalable pipelines. They use Groovy syntax and it may not be obvious:

    - Which operator to use
    - When to use it
    - Why the input shape needs to change

    Emphasise the **why**: operators exist to transform input data into the exact structure required by the next process.

    At this stage, learners do not need to memorise operators. they need to understand that:

    - Processes expect inputs in the correct format
    - Operators are the tool used to get data into those formats

    This section demonstrates only one example. Later lessons will showcase different requirements where different operators need to be used.

=== "Development and debugging best practices"

    Use this lesson to model real-world Nextflow development habits:

    - Encourage frequent use of `.view()` to inspect channel outputs
    - Encourage regular use of `-resume` to avoid re-running completed steps
    - Normalise frequent and fast iteration when learners develop their own pipelines

#### 2.3 Multiple process inputs

=== "Accessing process outputs"

    This lesson applies Lesson 1.7 to a bioinformatics use case. Recall that there are different valid ways to access outputs, such as:

    - Adding `.out` to the end of a process name only works for single-element channels
    - For single-element channels, using `.out[0]` is identical to `.out`
    - `emit` can be used to [name outputs](https://www.nextflow.io/docs/latest/process.html#naming-outputs)

=== "When inputs should be grouped together vs. separated"

    In this lesson, learners extend their workflow by defining a process that accepts multiple inputs and chaining it to upstream processes. 
    
    One thing to clarify is when processes should have inputs all in a single tuple, or as separate inputs.

    Emphasise to keep files, values, and metadata together in a tuple if they must stay together (e.g. sample ID, paired FASTQs).
    
    Inputs should be seperate if they can be shared across samples, or are constant across samples. For example, the reference index `transcriptome.fa` can be used across different paired FASTQs.

    Grouping everything as a tuple introduces unecessary data processing steps, while splitting incorrectly can result in unexpected behaviour, such as not all samples running.

#### 2.4 Combining channels, multiple process outputs

This lesson demonstrates how combining channels allows multiple process outputs to be collected and used by a single downstream process.

MultiQC is the ideal example to demonstrate this as it requires all bioinformatics tool outputs to be aggregated and run in a single output.

Note that the `input: path "*"` and `script: multiqc .` blocks follow the MultiQC Nextflow [integration recommendations](https://multiqc.info/docs/usage/pipelines/#nextflow). 

State that this permissive pattern is generally bad practice. Communicate to learners that it is highly preferred to be as explicit the exact files and folders required. This improves error handling, testing, and future maintainability.

#### 2.5 Upscaling to multiple samples and introspection

This final lesson demonstrates how a workflow that works for a single sample can be scaled to many samples without modifying the pipeline code itself. Advise learners that scaling in Nextflow is primarily a configuration problem, not a coding problem. By updating the samplesheet, the same workflow logic is reused to run tasks in parallel across multiple samples.

It is important to communicate that this section is **only an introduction to configuration, benchmarking, and scaling concepts**. Direct learners to the [Nextflow on HPC workshop](https://sydney-informatics-hub.github.io/nextflow-hpc-workshop/) which covers these topics in detail, and was developed as a sequel to this introductory workshop.

