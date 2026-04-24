This page provides links to the teaching materials used to deliver the workshop, along with guidance for trainers using or adapting them.

## Workshop materials

!!! note "Using these materials"

    These pages document the instructor-facing view of the workshop. The participant-facing workshop materials can be viewed in the [workshop materials](../workshop/index.md) section.

    To adapt and deploy the materials template for your own delivery, see the [deployment instructions]().

The workshop materials provide a hands-on introduction to Nextflow, with a focus on reproducible and scalable workflow development for bioinformatics. The workshop is structured in two parts, moving from foundational concepts to the practical development of a multi-sample workflow. 

The aim of the workshop is to introduce Nextflow best practices and focus on the concepts and features most useful for beginners. Because Nextflow has a broad feature set, the materials prioritise the knowledge learners need to begin using it confidently.

## Trainer guidance

While the workshop includes detailed technical content, trainers should continue to connect the material back to biology and research practice. The intended audience is bioscientists who want to use Nextflow to process data and run analyses in support of their research or applied work.

When teaching, it may help to emphasise:

- why workflow reproducibility matters
- how Nextflow supports scalable analysis
- how the examples relate to real bioinformatics tasks

## Notes from previous trainers

Below are lesson notes from trainers who have previously delivered this workshop.

### Part 1 - Nextflow foundations

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

### Part 2 - Nextflow hands-on practice - multi-sample workflow development

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

